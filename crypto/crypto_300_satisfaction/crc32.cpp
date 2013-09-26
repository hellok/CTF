#include <cstring>
#include <cstdio>
#include <map>
#include <set>
#include <queue>

#define POLY 0x04C11DB7L

using namespace std;

static unsigned int crc_table[256];
unsigned int get_sum_poly(unsigned char data)
{
	unsigned int sum_poly = data;
	sum_poly <<= 24;
	for(int j = 0; j < 8; j++) {
		int hi = sum_poly & 0x80000000;
		sum_poly <<= 1;
		if(!hi) sum_poly = sum_poly ^ POLY;
	}
	return sum_poly;
}

void create_crc_table()
{
	for(int i = 0; i < 256; i++)
		crc_table[i] = get_sum_poly(i & 0xFF);
}

unsigned int CRC32_byte(unsigned char data[] , int len)
{
	unsigned int r = 0, sum_poly = 0;
	for(int i = 0; i < len; i++)
		  r = (r<<8) ^ crc_table[(r >> 24) ^ data[i]];
	return r;
}

unsigned int CRC32_bit(unsigned char data[], int len)
{
	unsigned int r = 0;
	unsigned int s;
	for (int i = 0; i < len; i++) {
		s = data[i] << 24;
		for (int j = 0; j < 8; j++) {
			if (!((r ^ s) & 0x80000000))
				r = (r << 1) ^ POLY;
			else
				r = r << 1;
			s = s << 1;
		}
	}
	return r;
}

inline unsigned int extend(unsigned int r, unsigned char s)
{
	return (r << 8) ^ crc_table[(r >> 24) ^ s];
}

unsigned char charset[8] = "+-<>[].";

set<unsigned int> S;

int const K = 1000000;

unsigned int Q[K], _Q[K];
unsigned char p1[K], p2[K];
unsigned int q1[K], q2[K];
int h = 0, t = 1;

void reverse(unsigned int r, unsigned char s, int pos)
{
	for (unsigned int i = 0; i != 255; i++) { //
		unsigned x = (r ^ crc_table[i]) >> 8;
		x |= (i ^ s) << 24;
		if (extend(x, s) == r) {
			if (S.find(x) == S.end()) {
				S.insert(x);
				Q[++t] = x; p1[t] = s; q1[t] = pos;
			}
		}
	}
}

void bfs_build()
{
	Q[1] = 1;
	S.insert(1);
	while (t <= K && h < t) {
		unsigned int r = Q[++h];
		for (int i = 0; i < 4; i++) {	//	!!	don't use .
			reverse(r, charset[i], h);
		}
	}
}

unsigned char ans[K];
int step;

void bfs_run(unsigned int r)
{
	h = 0;
	t = 1;
	_Q[1] = r; q2[1] = 0;
	bool found = false;
	while (!found) {
		unsigned int x = _Q[++h];
		for (int i = 0; i < 4; i++) {
			unsigned int y = extend(x, charset[i]);
			if (S.find(y) != S.end()) {
				_Q[++t] = y; p2[t] = charset[i]; q2[t] = h;
				found = true;
				fprintf(stderr, "Meet at %08x\n", y);
				step = 0;
				for (int z = t; q2[z] ; z = q2[z]) {
					ans[step++] = p2[z];
					fprintf(stderr, "%08x %08x %c\n", _Q[q2[z]], _Q[z], p2[z]);
				}
				for (int j = 0; j * 2 < step; j++) {
					int k = ans[j]; ans[j] = ans[step - 1 - j]; ans[step - 1 - j] = k;
				}
				int pos = 0;
				while (Q[pos] != y && pos < K) pos++;
				fprintf(stderr, "Found at Q[%d]\n", pos);
				for (int z = pos; Q[z] != 1 ; z = q1[z]) {
					ans[step++] = p1[z];
					fprintf(stderr, "%08x %08x %c\n", Q[z], Q[q1[z]], p1[z]);
				}
				fprintf(stderr, "%d\n", step);
				for (int i = 0 ; i < step; i++)
					printf("%c", ans[i]);
			} else {
				_Q[++t] = y; p2[t] = charset[i]; q2[t] = h;
			}
		}
	}
}

unsigned char buff[65536];

int main()
{
	int l;
	scanf("%d\n", &l);
	scanf("%s", buff);
	create_crc_table();
	unsigned int r = CRC32_byte(buff, l);
	fprintf(stderr, "%08x\n\n", r);
	bfs_build();
	fprintf(stderr, "%d\n", S.size());
	bfs_run(r);
	return 0;
}
