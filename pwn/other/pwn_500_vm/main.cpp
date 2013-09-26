#include <cstddef>
#include <cstdint>
#include <boost/cstdint.hpp>
#include <algorithm>
#include <iostream>
#include <fstream>
#include <dirent.h>
#include <string.h>
#include <stdio.h>

class System {
public:
	typedef std::uint16_t addr_t;
	typedef std::uint16_t reg_t;
	typedef std::uint8_t mem_t;
	typedef std::uint16_t inst_t;
	static const std::size_t mem_sz = 0x10000;
	static const std::size_t reg_num = 16;

private:
	union {
		reg_t registers[reg_num];
		struct {
			reg_t ip;
			reg_t sp;
			reg_t fr;
			reg_t sr[reg_num - 3];
		};
	};
	reg_t second_registers[reg_num];
	mem_t memory[mem_sz];
	addr_t bios_mode_barrier;
	bool bios_mode;

	struct File {
		char name[256];
		char data[4096];
	};
	std::vector<File> files;

	struct OpenFile {
		OpenFile(std::uint16_t f) : file(f), pos(0) {}
		std::uint16_t file, pos;
	};
	std::vector<OpenFile> open_files;

	template<class T>
	T& mem(const addr_t addr) {
		if(static_cast<std::size_t>(addr) > static_cast<std::size_t>(mem_sz - sizeof(T)))
			throw 1;
		if((!bios_mode) && (addr < bios_mode_barrier))
			throw 1;
		return *reinterpret_cast<T*>(&memory[addr]);
	}

	void reset() {
		std::fill(registers, registers + reg_num, (reg_t)0);
		std::fill(memory, memory + mem_sz, (mem_t)0);
		bios_mode_barrier = 0;
		bios_mode = true;

		std::ifstream fs("bios.bin", std::ifstream::binary);
		fs.read(reinterpret_cast<char*>(memory), sizeof(memory));
		fs.close();

		files.clear();
		open_files.clear();
		DIR* d(opendir("."));
		if(!d)
			return;
		struct dirent *de;
		while(de = readdir(d)) {
			files.resize(files.size() + 1);
			File &f(files.back());

			strncpy(f.name, de->d_name, sizeof(f.name));
			f.name[sizeof(f.name) - 1] = 0;

			std::ifstream fs(f.name, std::ifstream::binary);
			fs.read(f.data, sizeof(f.data));
			fs.close();
		}
		closedir(d);
	}

	template<class T>
	void push(T val) {
		sp -= sizeof(T);
		mem<T>(sp) = val;
	}

	template<class T>
	T pop() {
		T tmp(mem<T>(sp));
		sp += sizeof(T);
		return tmp;
	}

	void op_nop(inst_t) {}
	void op_debug(inst_t) {
		std::cout << "Debug:" << std::endl;
		for(unsigned int i(0); i < 16; ++i)
			std::cout << i << ": " << registers[i] << std::endl;
		std::cout << std::endl;
	}
	void op_add_mul(inst_t inst) {
		reg_t &a(registers[(inst >>  4) & 0xf]);
		reg_t &b(registers[(inst >>  8) & 0xf]);
		reg_t &c(registers[(inst >> 12) & 0xf]);
		if(&b < &c)
			a = b + c;
		else
			a = b * c;
	}
	void op_sub(inst_t inst) {
		reg_t &a(registers[(inst >>  4) & 0xf]);
		reg_t &b(registers[(inst >>  8) & 0xf]);
		reg_t &c(registers[(inst >> 12) & 0xf]);
		a = b - c;
	}
	void op_div(inst_t inst) {
		reg_t &a(registers[(inst >>  4) & 0xf]);
		reg_t &b(registers[(inst >>  8) & 0xf]);
		reg_t &c(registers[(inst >> 12) & 0xf]);
		a = b / c;
	}
	void op_mod(inst_t inst) {
		reg_t &a(registers[(inst >>  4) & 0xf]);
		reg_t &b(registers[(inst >>  8) & 0xf]);
		reg_t &c(registers[(inst >> 12) & 0xf]);
		a = b % c;
	}
	void op_xor(inst_t inst) {
		reg_t &a(registers[(inst >>  4) & 0xf]);
		reg_t &b(registers[(inst >>  8) & 0xf]);
		reg_t &c(registers[(inst >> 12) & 0xf]);
		//std::cout << "r" << ((inst >>  4) & 0xf) << " = r" << ((inst >>  8) & 0xf) << " ^ r" << ((inst >> 12) & 0xf) << std::endl;
		a = b ^ c;
	}
	void op_and_or(inst_t inst) {
		reg_t &a(registers[(inst >>  4) & 0xf]);
		reg_t &b(registers[(inst >>  8) & 0xf]);
		reg_t &c(registers[(inst >> 12) & 0xf]);
		if(&b < &c)
			a = b & c;
		else
			a = b | c;
	}
	void op_shl(inst_t inst) {
		reg_t &a(registers[(inst >>  4) & 0xf]);
		reg_t &b(registers[(inst >>  8) & 0xf]);
		reg_t &c(registers[(inst >> 12) & 0xf]);
		a = b << c;
	}
	void op_shr(inst_t inst) {
		reg_t &a(registers[(inst >>  4) & 0xf]);
		reg_t &b(registers[(inst >>  8) & 0xf]);
		reg_t &c(registers[(inst >> 12) & 0xf]);
		a = b >> c;
	}
	void op_rol(inst_t inst) {
		reg_t &a(registers[(inst >>  4) & 0xf]);
		reg_t &b(registers[(inst >>  8) & 0xf]);
		reg_t &c(registers[(inst >> 12) & 0xf]);
		a = (b << c) | (b >> (16 - c));
	}
	void op_ror(inst_t inst) {
		reg_t &a(registers[(inst >>  4) & 0xf]);
		reg_t &b(registers[(inst >>  8) & 0xf]);
		reg_t &c(registers[(inst >> 12) & 0xf]);
		a = (b >> c) | (b << (16 - c));
	}
	void op_movi(inst_t inst) {
		reg_t &a(registers[(inst >>  4) & 0xf]);
		std::uint8_t b(inst >>  8);
		a = b;
	}
	void op_movli(inst_t inst) {
		reg_t &a(registers[(inst >>  4) & 0xf]);
		std::uint8_t b(inst >>  8);
		a &= 0xff00;
		a |= b;
	}
	void op_movui(inst_t inst) {
		reg_t &a(registers[(inst >>  4) & 0xf]);
		std::uint8_t b(inst >>  8);
		a &= 0xff;
		a |= b << 8;
	}
	void op_jmpifi(inst_t inst) {
		std::uint8_t a((inst >>  4) & 0xf);
		std::int8_t b(inst >>  8);
		if((fr >> a) & 1)
			ip += b;
	}
	void op_jmpifni(inst_t inst) {
		std::uint8_t a((inst >>  4) & 0xf);
		std::int8_t b(inst >>  8);
		if(!((fr >> a) & 1))
			ip += b;
	}
	reg_t syscall_create() {
		reg_t id(files.size());
		if(id >= 0x8000)
			return 0xffff;
		files.resize(files.size() + 1);
		files.back().name[0] = 0;
		
		return id;
	}
	reg_t syscall_open(reg_t id) {
		if(id >= files.size())
			return 0xffff;
		reg_t fd(open_files.size());
		if(fd >= 0x8000) {
			for(std::vector<OpenFile>::iterator of(open_files.begin()); of != open_files.end(); ++of) {
				if(of->file != 0xffff)
					continue;
				of->file = id;
				of->pos = 0;
				return of - open_files.begin();
			}
			return 0xfffe;
		}
		open_files.push_back(OpenFile(id));
		return fd;
	}
	reg_t syscall_close(reg_t fd) {
		if((fd >= open_files.size()) || open_files[fd].file == 0xffff)
			return 0xffff;
		open_files[fd].file = 0xffff;
		return 0;
	}
	reg_t syscall_read(reg_t fd) {
		if((fd >= open_files.size()) || open_files[fd].file == 0xffff)
			return 0xffff;
		OpenFile &of(open_files[fd]);
		File &f(files[of.file]);
		if(of.pos >= sizeof(File::data))
			return 0xfffe;
		return reinterpret_cast<const std::uint8_t*>(f.data)[of.pos++];
	}
	reg_t syscall_write(reg_t fd, reg_t data) {
		if((fd >= open_files.size()) || open_files[fd].file == 0xffff)
			return 0xffff;
		OpenFile &of(open_files[fd]);
		File &f(files[of.file]);
		if(of.pos >= sizeof(File::data))
			return 0xfffe;
		f.data[of.pos++] = data;
		return 0;
	}
	reg_t syscall_seek(reg_t fd, reg_t pos) {
		if((fd >= open_files.size()) || open_files[fd].file == 0xffff)
			return 0xffff;
		if(pos > sizeof(File::data))
			return 0xfffe;
		open_files[fd].pos = pos;
		return 0;
	}
	reg_t syscall_set_name(reg_t id, reg_t name) {
		if(id >= files.size())
			return 0xffff;
		File &f(files[id]);
		unsigned int i(0);
		while(i < (sizeof(File::name) - 1)) {
			if(!(f.name[i] = mem<char>(name + i)))
				return i;
			++i;
		}
		f.name[i++] = 0;
		return i;
	}
	reg_t syscall_get_name(reg_t id, reg_t name) {
		if(id >= files.size())
			return 0xffff;
		File &f(files[id]);
		unsigned int i(0);
		while(i < (sizeof(File::name) - 1)) {
			if(!(mem<char>(name + i) = f.name[i]))
				return i;
			++i;
		}
		mem<char>(name + i++) = 0;
		return i;
	}
	reg_t syscall_num_files() {
		return files.size();
	}
	reg_t syscall_read_term() {
		char buf;
		if(read(0, &buf, 1) == 1)
			return buf;
		return 0xffff;
	}
	reg_t syscall_write_term(reg_t data) {
		char buf;
		if(write(1, &data, 1) == 1)
			return 1;
		return 0xffff;
	}
	reg_t syscall_find(reg_t name) {
		for(std::vector<File>::const_iterator f(files.begin()); f != files.end(); ++f) {
			for(unsigned int i(0); i < (sizeof(File::name)  - 1); ++i) {
				if(mem<char>(name + i) != f->name[i])
					break;
				if(!f->name[i])
					return f - files.begin();
			}
		}
		return 0xffff;
	}
	void syscall_set_barrier(reg_t val) {
		if(bios_mode)
			bios_mode_barrier = val;
	}
	void op_syscall(inst_t) {
		if(!bios_mode) {
			bios_mode = true;
			second_registers[0] = ip;
			ip = 0;
			return;
		}
		switch(sr[0]) {
		case 0: //reset
			break;

		case 1: //create
			sr[0] = syscall_create();
			//printf("created file %d\n", sr[0]);
			break;

		case 2: //read_term
			sr[0] = syscall_read_term();
			break;

		case 3: //open
			sr[0] = syscall_open(sr[1]);
			//printf("opened file %d (%s): %d\n", sr[1], files[sr[1]].name, sr[0]);
			break;

		case 4: //close
			sr[0] = syscall_close(sr[1]);
			//printf("closed fd %d: %d\n", sr[1], sr[0]);
			break;

		case 5: //read
			sr[0] = syscall_read(sr[1]);
			//printf("read from fd %d: %d\n", sr[1], sr[0]);
			break;

		case 6: //write_term
			sr[0] = syscall_write_term(sr[1]);
			break;

		case 7: //write
			sr[0] = syscall_write(sr[1], sr[2]);
			break;

		case 8: //seek
			sr[0] = syscall_seek(sr[1], sr[2]);
			break;

		case 9: //get name
			sr[0] = syscall_get_name(sr[1], sr[2]);
			break;

		case 10: //set name
			sr[0] = syscall_set_name(sr[1], sr[2]);
			break;

		case 11: //find
			sr[0] = syscall_find(sr[1]);
			//printf("searched file: %d\n", sr[0]);
			break;

		case 12: //num files
			sr[0] = syscall_num_files();
			break;

		case 13: //set_barrier
			syscall_set_barrier(sr[1]);
		}
	}
	void op_mov(inst_t inst) {
		reg_t &a(registers[(inst >>  4) & 0xf]);
		reg_t &b(registers[(inst >>  8) & 0xf]);
		a = b;
	}
	void op_xchg(inst_t inst) {
		reg_t &a(registers[(inst >>  4) & 0xf]);
		reg_t &b(registers[(inst >>  8) & 0xf]);
		reg_t tmp = b;
		b = a;
		a = b;
	}
	void op_calli(inst_t inst) {
		std::int8_t a(inst >> 4);
		push<addr_t>(ip);
		ip += a;
	}
	void op_jmpi(inst_t inst) {
		std::int8_t a(inst >> 4);
		ip += a;
	}
	void op_loadb(inst_t inst) {
		reg_t &a(registers[(inst >>  4) & 0xf]);
		reg_t &b(registers[(inst >>  8) & 0xf]);
		a = mem<std::uint8_t>(b);
	}
	void op_storb(inst_t inst) {
		reg_t &a(registers[(inst >>  4) & 0xf]);
		reg_t &b(registers[(inst >>  8) & 0xf]);
		mem<std::uint8_t>(a) = b;
		//std::cout << a << " ... " << b << (unsigned int)b << " ... " << ((inst >>  4) & 0xf) << " ... " << ((inst >>  8) & 0xf) << std::endl;
	}
	void op_loadw(inst_t inst) {
		reg_t &a(registers[(inst >>  4) & 0xf]);
		reg_t &b(registers[(inst >>  8) & 0xf]);
		a = mem<reg_t>(b);
	}
	void op_storw(inst_t inst) {
		reg_t &a(registers[(inst >>  4) & 0xf]);
		reg_t &b(registers[(inst >>  8) & 0xf]);
		mem<reg_t>(a) = b;
	}
	void op_push(inst_t inst) {
		std::uint8_t a(inst >>  4);
		push<std::uint8_t>(a);
	}
	void op_jmpif(inst_t inst) {
		std::uint8_t a((inst >>  4) & 0xf);
		reg_t &b(registers[(inst >>  4) & 0xf]);
		if((fr >> a) & 1)
			ip = b;
	}
	void op_jmpnif(inst_t inst) {
		std::uint8_t a((inst >>  4) & 0xf);
		reg_t &b(registers[(inst >>  4) & 0xf]);
		if(!((fr >> a) & 1))
			ip = b;
	}
	void op_dbl(inst_t inst) {
		reg_t &a(registers[(inst >>  4) & 0xf]);
		reg_t &b(registers[(inst >>  8) & 0xf]);
		a = b << 1;
	}
	void op_cmp(inst_t inst) {
		reg_t &a(registers[(inst >>  4) & 0xf]);
		reg_t &b(registers[(inst >>  8) & 0xf]);
		fr &= ~7;
		if(a == b)
			fr = 1;
		else if(a > b)
			fr = 2;
		else
			fr = 4;
	}
	void op_not(inst_t inst) {
		reg_t &a(registers[(inst >>  4) & 0xf]);
		reg_t &b(registers[(inst >>  8) & 0xf]);
		a = ~b;
	}
	void op_callr(inst_t inst) {
		reg_t &a(registers[(inst >>  4) & 0xf]);
		push<addr_t>(ip);
		ip = a;
	}
	void op_jmpr(inst_t inst) {
		reg_t &a(registers[(inst >>  4) & 0xf]);
		ip = a;
	}
	void op_test(inst_t inst) {
		reg_t &a(registers[(inst >>  4) & 0xf]);
		fr &= ~(8|16);
		if(!a)
			fr |= 8;
		else if(a >= 0x8000)
			fr |= 16;
	}
	void op_inc(inst_t inst) {
		reg_t &a(registers[(inst >>  4) & 0xf]);
		++a;
	}
	void op_dec(inst_t inst) {
		reg_t &a(registers[(inst >>  4) & 0xf]);
		--a;
	}
	void op_pushb(inst_t inst) {
		reg_t &a(registers[(inst >>  4) & 0xf]);
		push<std::uint8_t>(a);
	}
	void op_pushw(inst_t inst) {
		reg_t &a(registers[(inst >>  4) & 0xf]);
		push<std::uint16_t>(a);
	}
	void op_popb(inst_t inst) {
		reg_t &a(registers[(inst >>  4) & 0xf]);
		a = pop<std::uint8_t>();
	}
	void op_popw(inst_t inst) {
		reg_t &a(registers[(inst >>  4) & 0xf]);
		a = pop<std::uint16_t>();
	}
	void op_r_switch(inst_t inst) {
		reg_t &a(registers[(inst >>  4) & 0xf]);
		reg_t &b(second_registers[(inst >> 4) & 0xff]);
		reg_t tmp(a);
		a = b;
		b = tmp;
	}
	void op_ret(inst_t inst) {
		ip = pop<addr_t>();
	}
	void op_sysret(inst_t inst) {
		if(bios_mode) {
			bios_mode = false;
			ip = second_registers[0];
		}
	}
	void op_sysret_jmpr(inst_t inst) {
		if(bios_mode) {
			bios_mode = false;
			op_jmpr(inst);
		}
	}

	typedef void (System::*opcode_f)(inst_t);
	opcode_f opcode_table[16 * 4] = {
		NULL,
		&System::op_add_mul,
		&System::op_sub,
		&System::op_div,
		&System::op_mod,
		&System::op_xor,
		&System::op_and_or,
		&System::op_shl,
		&System::op_shr,
		&System::op_rol,
		&System::op_ror,
		&System::op_movi,
		&System::op_movli,
		&System::op_movui,
		&System::op_jmpifi,
		&System::op_jmpifni,

		NULL,
		&System::op_mov,
		&System::op_xchg,
		&System::op_calli,
		&System::op_jmpi,
		&System::op_loadb,
		&System::op_storb,
		&System::op_loadw,
		&System::op_storw,
		&System::op_push,
		&System::op_jmpif,
		&System::op_jmpnif,
		&System::op_cmp,
		&System::op_dbl,
		&System::op_nop,
		&System::op_nop,

		NULL,
		&System::op_callr,
		&System::op_jmpr,
		&System::op_test,
		&System::op_inc,
		&System::op_dec,
		&System::op_pushb,
		&System::op_pushw,
		&System::op_popb,
		&System::op_popw,
		&System::op_r_switch,
		&System::op_sysret_jmpr,
		&System::op_nop,
		&System::op_nop,
		&System::op_nop,
		&System::op_nop,

		NULL,
		&System::op_ret,
		&System::op_syscall,
		&System::op_debug,
		&System::op_sysret,
		&System::op_nop,
		&System::op_nop,
		&System::op_nop,
		&System::op_nop,
		&System::op_nop,
		&System::op_nop,
		&System::op_nop,
		&System::op_nop,
		&System::op_nop,
		&System::op_nop,
		&System::op_nop,
	};

public:
	System() {
		reset();
	}

	void run() {
		try {
			ip = 0;
			while(true) {
				inst_t inst = mem<inst_t>(ip);
				//printf("0x%04x: 0x%04x\n", ip, inst);
				ip += sizeof(inst_t);
				const opcode_f *opcode = opcode_table;
				if(inst) {
					while(!(inst & 0xf)) {
						inst >>= 4;
						opcode += 16;
					}
					opcode += inst & 0xf;
					(this->**opcode)(inst);
				}
				else
					throw 2;
			}
		}
		catch(...) {
			op_debug(0);
		}
	}
};

int main() {
	System s;
	s.run();
}
