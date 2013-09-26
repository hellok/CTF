def b2i(s):
	ret = 0L
	for i in s:
		ret = (ret << 8) + ord(i)
	return ret

def ssh_rsa(text):
	text = text.split()[1].decode('base64')
    
	l = b2i(text[:4])
	text = text[4:]
	print text[:l]
	text = text[l:]
    
	l = b2i(text[:4])
	e=b2i(text[4:l+4])
	text = text[l+4:]
    
	l = b2i(text[:4])
	n=b2i(text[4:l+4])
    
	return {'e':e, 'n':n}



if __name__ == '__main__' :
	print ssh_rsa(open('authorized_keys').read())