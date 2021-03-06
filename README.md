# Add Nginx virtual hosts :ghost:

Simple Bash script that help you add virtual hosts to Nginx, because it's a pain to create them manually for each new web.
To generate an HTTPS certificate, you need to have certbot installed. If you don't have a certbot and want to use it, follow [these instructions](https://certbot.eff.org/instructions).

![Output of this simple script](https://kosc.cz/nginx_virt_host.png)


## Install instructions

Just simple use git to clone this repo, or download the files mentioned above to one directory.

### How to clone to your server:
```
git clone https://github.com/spajk-cz/add_nginx_vhost
cd add_nginx_vhost/
chmod +x nginx_add_hosts.sh
./nginx_add_hosts.sh
```
Hooooray! :tada:

## If script return error... :exploding_head:
If it return error like `bash: ./nginx_add_hosts.sh: /bin/bash^M: bad interpreter: No such file or directory` use this command:
```
sed -i -e 's/\r$//' nginx_add_hosts.sh
```
This problem is caused by creating scripts in Windows/Mac env, because Unix uses different line endings. And i sometimes use Win or Mac stations. :wink:


## Next tasks
- [x] Add automatic script for Certbot to generate valid SSL certificate for each new host.
- [ ] Check if certbot is installed before running it.