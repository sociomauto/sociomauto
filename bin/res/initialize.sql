CREATE TABLE tblAccount (
    AccountID INTEGER,
    AccountName TEXT
);

CREATE TABLE tblProperty (
    PropertyID INTEGER,
    AccountID INTEGER,
    PropertyType TEXT,
    PropertyName TEXT,
    PropertyDescription TEXT
);

CREATE TABLE tblEntity (
    EntityID INTEGER,
    EntityType TEXT,
    ParentID INTEGER,
    CreateUserID INTEGER,
    CreateUser TEXT,
    CreateDate DATETIME,
    ModifyUserID INTEGER,
    ModifyUser TEXT,
    ModifyDate DATETIME
);

CREATE TABLE tblUserEntity (
    UserEntityID INTEGER,
    EntityID INTEGER,
    ParentID INTEGER,
    AccountID INTEGER,
    FirstName TEXT,
    LastName TEXT,
    EmailAddress TEXT,
    PassHash TEXT,
    HomePhone TEXT,
    MobilePhone TEXT,
    WorkPhone TEXT,
    WebAddress TEXT
);

CREATE TABLE tblProspectEntity (
    ProspectEntityID INTEGER,
    EntityID INTEGER,
    ParentID INTEGER,
    FirstName TEXT,
    LastName TEXT,
    EmailAddress TEXT,
    HomePhone TEXT,
    WorkPhone TEXT,
    MobilePhone TEXT,
    Address1 TEXT,
    Address2 TEXT,
    Address3 TEXT,
    City TEXT,
    State TEXT, 
    Postal TEXT,
    Coutnry TEXT
);