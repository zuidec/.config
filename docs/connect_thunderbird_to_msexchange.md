# Connecting to MS Exchange

-------------------------------------------------------------------------------

1. Open thunderbird and create a new email.
2. Click on advanced settings
3. Enter the following for incoming server:

```bash
    Server type: IMAP
    Server name: outlook.office365.com
    Port: 993
    User Name: 'YOUR@EMAIL.COM'
    Connection security: SSL/TLS
    Authentication method: OAuth2
```

4. Then enter the following for the outgoing server:

```bash
    Server Name: smtp.office365.com
    Port: 587
    User Name: 'YOUR@EMAIL.COM'
    Connection security: STARTTLS
    Authentication settings: OAuth2
```

5. At this point you can click done and you should be prompted to login!

