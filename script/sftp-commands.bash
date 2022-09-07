#Generate new key
ssh-keygen

cat /home/guavus/.ssh/id_rsa.pub

#Put public key to the sftp server's authorized_keys file
sudo vim /home/muralsftp/.ssh/authorized_keys

#Check password less connection to sftp using rsa key
sftp -i ~/.ssh/id_rsa muralsftp@mural02.cloud.in.guavus.com

cd /data/collector/
sudo mkdir haresh
chmod 777 haresh

#sftp -i ~/.ssh/id_rsa muralsftp@
sftp -i ~/.ssh/id_rsa muralsftp@mural02.cloud.in.guavus.com:/haresh/ <<< $'put ~/1.txt'

sftp -i ~/.ssh/id_rsa muralsftp@mural02.cloud.in.guavus.com:/haresh/ <<< $'put /home/guavus/1.txt'