# Creating a user for Terraform

## To Decode

```bash
terraform output encrypted_secret | base64 --decode | keybase pgp decrypt
```

```powershell
Set-Content -Path .\secret.b64 -Value $(terraform output AWS_Secret_Access_Key)

certutil -decode .\secret.b64 .\secret.txt

keybase pgp decrypt -i secret.txt
```

Then a dialog appears and you enter your pass-phrase to decode it.

Then add your profile:

```cli
aws configure --profile terraform
```

Now you can determine the least priviledge required for a user for a module to work.
