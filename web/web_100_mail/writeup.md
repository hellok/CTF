Base64 decode the attchment to file 'source.tar.bz2', then uncompress it. We will got a source code handler.rb

From the source code, we know that:

* Interaction through subject of a mail to 'test@b3.ctf.sigint.ccc.de'
* a command 'get <filename>' is valid if file exists, which will replay us with the file as attachment


codes below are interesting:

	user= [incoming_mail.from].flatten[0].gsub('"', "")
	#some codes else
	user_dir= users_dir + user.split("@", 2).reverse.join("___")
	
	def send_response(original_mail, response_string, 	attachment= nil, response_subject=nil)
		Mail.deliver do |mail|
			to original_mail.from
			from original_mail.to
			subject response_subject || "Re: #{original_mail.subject}"
			add_file attachment if attachment
			body <<EOF
			
* server create seperated directory to registed user depends on the first sender
* server reply all senders
* sender emails are not checked

It seems to be a [LFI-liked](http://hakipedia.com/index.php/Local_File_Inclusion) problem

we will got /etc/passwd via a malicious mail address

[Solution](solve.py)