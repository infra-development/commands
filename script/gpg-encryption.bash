#Encrypt
gpg --batch --passphrase abc123 --cipher-algo AES256 --symmetric file_to_be_encrypted

#Decrypt
gpg --output outpout_file_name --decrypt input_file_name.gpg
gpg --output UK_DPI_CONV-SGBE02-10.172.2.8-10.244.23.33-000000001_ALLOT_M_15_11072022103048_F_1_0_0.csv.bz2 --decrypt UK_DPI_CONV-SGBE02-10.172.2.8-10.244.23.33-000000001_ALLOT_M_15_11072022103048_F_1_0_0.csv.bz2.gpg

