USE master;
IF EXISTS(SELECT * FROM sys.databases WHERE name = 'testdb') DROP DATABASE testdb;
CREATE DATABASE testdb;