$credential = Get-Credential
$uname = $credential.UserName
$pass =  $credential.GetNetworkCredential().Password
$server = "ecooldb.ccd1ufibwvil.us-west-1.rds.amazonaws.com"
$db = "Ecooldev"

$command = "
    IF OBJECT_ID('custEmails','U') IS NOT NULL
        DROP TABLE custEmails;
    IF OBJECT_ID('custShipping','U') IS NOT NULL
        DROP TABLE custShipping; 
    IF OBJECT_ID('custPhones','U') IS NOT NULL
        DROP TABLE custPhones; 
    IF OBJECT_ID('states','U') IS NOT NULL
        DROP TABLE states;
    IF OBJECT_ID('customers','U') IS NOT NULL
        DROP TABLE customers;
    CREATE TABLE customers(
        custid INT IDENTITY,
        lastName VARCHAR(255),
        firstName VARCHAR(255),
        PRIMARY KEY(custid)
    );
    CREATE TABLE custEmails(
        custid INT REFERENCES customers(custid) NOT NULL,
        email VARCHAR(255),
        PRIMARY KEY(custid, email)
    );
    CREATE TABLE states(
        code VARCHAR(20) NOT NULL,
        name VARCHAR(64) NOT NULL,
        PRIMARY KEY (name)
    );
    --custShipping constraint to force zip code to have correct number of digits
    CREATE TABLE custShipping(
        custid INT REFERENCES customers(custid) NOT NULL,
        state VARCHAR(64) REFERENCES states(name) NOT NULL,
        zipCode INT,
        CONSTRAINT chk_zipCode CHECK(zipCode >= 10000 AND zipCode  <= 99999)
    );

    CREATE TABLE custPhones(
        custid INT REFERENCES customers(custid) NOT NULL,
        phoneNumber VARCHAR(15),
        CONSTRAINT chk_phoneNumber CHECK(phoneNumber LIKE '[0-9][0-9][0-9]-[0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]')
    );

    INSERT INTO states(code, name) VALUES ('AL','Alabama'), ('AK','Alaska'), ('AS','American Samoa'), ('AZ','Arizona'), ('AR','Arkansas'), ('CA','California'), ('CO','Colorado'), ('CT','Connecticut'), ('DE','Delaware'), ('DC','District of Columbia'), ('FM','Federated States of Micronesia'), ('FL','Florida'), ('GA','Georgia'), ('GU','Guam'), ('HI','Hawaii'), ('ID','Idaho'), ('IL','Illinois'), ('IN','Indiana'), ('IA','Iowa'), ('KS','Kansas'), ('KY','Kentucky'), ('LA','Louisiana'), ('ME','Maine'), ('MH','Marshall Islands'), ('MD','Maryland'), ('MA','Massachusetts'), ('MI','Michigan'), ('MN','Minnesota'), ('MS','Mississippi'), ('MO','Missouri'), ('MT','Montana'), ('NE','Nebraska'), ('NV','Nevada'), ('NH','New Hampshire'), ('NJ','New Jersey'), ('NM','New Mexico'), ('NY','New York'), ('NC','North Carolina'), ('ND','North Dakota'), ('MP','Northern Mariana Islands'), ('OH','Ohio'), ('OK', 'Oklahoma'), ('OR','Oregon'), ('PW','Palau'), ('PA','Pennsylvania'), ('PR','Puerto Rico'), ('RI','Rhode Island'), ('SC','South Carolina'), ('SD','South Dakota'), ('TN','Tennessee'), ('TX','Texas'), ('UT','Utah'), ('VT','Vermont'), ('VI','Virgin Islands'), ('VA','Virginia'), ('WA','Washington'), ('WV','West Virginia'), ('WI','Wisconsin'), ('WY','Wyoming');
"

Invoke-Sqlcmd -ServerInstance $server -Database $db -Username $uname -Password $pass -Query $command
#name, type, conditions