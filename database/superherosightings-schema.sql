DROP DATABASE IF EXISTS superHeroSightings;

CREATE DATABASE superHeroSightings;

USE superHeroSightings;

CREATE table hero(
	heroId INT PRIMARY KEY AUTO_INCREMENT,
    heroName VARCHAR(50) NOT NULL,
    heroDescription VARCHAR(100)
);

CREATE table superpower(
	powerId INT PRIMARY KEY AUTO_INCREMENT,
    powerName VARCHAR(25) NOT NULL,
    powerDescription VARCHAR(100)
);

CREATE table heroSuperpower(
	heroId INT NOT NULL,
    powerId INT NOT NULL,
    CONSTRAINT FOREIGN KEY FK_superpower_hero (heroId)
		REFERENCES hero (heroId),
    CONSTRAINT FOREIGN KEY FK_hero_superpower (powerId)
		REFERENCES superpower (powerId)
);

CREATE table organisation(
	organisationId INT PRIMARY KEY AUTO_INCREMENT,
    organisationName VARCHAR(25) NOT NULL,
    organisationDescription VARCHAR(100),
    address VARCHAR(50),
    contactInfo VARCHAR(50)
);

CREATE table heroOrganisation(
	heroId INT NOT NULL,
    organisationId INT NOT NULL,
    CONSTRAINT FOREIGN KEY FK_organisation_hero (heroId)
		REFERENCES hero (heroId),
    CONSTRAINT FOREIGN KEY FK_hero_organiastion (organisationId)
		REFERENCES organisation (organisationId)
);

CREATE table location(
	locationId INT PRIMARY KEY AUTO_INCREMENT,
    locationName VARCHAR(50) NOT NULL,
    latitude DECIMAL(8,6) NOT NULL,
    longitude DECIMAL(9,6) NOT NULL,
    locationDescription VARCHAR(100),
    addressInfo VARCHAR(50)
);

CREATE table sighting(
	sightingId INT PRIMARY KEY AUTO_INCREMENT,
    locationId INT NOT NULL,
    date DATETIME NOT NULL,    
	CONSTRAINT FOREIGN KEY FK_sighting_location (locationId)
	REFERENCES location (locationId)
);

CREATE table heroSighting(
	heroId INT NOT NULL,
    sightingId INT NOT NULL,
    CONSTRAINT FOREIGN KEY FK_sighting_hero (heroId)
		REFERENCES hero (heroId),
    CONSTRAINT FOREIGN KEY FK_hero_sighting (sightingId)
		REFERENCES sighting (sightingId)
);