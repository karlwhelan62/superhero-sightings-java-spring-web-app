# Database Design & Specification
We need to design a database to store our data objects. From our requirements above we can identify
our initial entities and their attributes.

Below are our entities and fields:
* Hero/Villian
    * Name
    * Description
    * Superpower(s)
    * Organisation(s)
* Organisation
    * Name
    * Description
    * Address
    * Contact
    * Member(s)
* Location
    * Name
    * Description
    * Adress Information
    * Latitude
    * Longitude
* Sighting
    * Hero
    * Location
    * Date

# Normalising The Database 
Before we think about normalising, we should notice that we need ID’s for each entity. Now for 1NF,
we need to identify many-to-many relationships. Heros can have multiple superpowers and
superpowers can be had by multiple heroes. Heros can have more than one organisation and
organisations will generally have more than one hero. Heros can have more than one sightings and
sightings can consist of more than one hero. We need to add a superpower entity and bridging tables
for the three many-to-many relationships.

We now need to think about one-to-many relationships. A location could have multiple sightings, but
sightings only happen in one location. We will adjust our entities for 1NF.

* Hero
    * heroId (PK)
    * heroName
    * heroDescription
* Superpower
    * powerId(PK)
    * powerName
    * powerDescription
* HeroSuperpower
    * heroId(PK, FK)
    * powerId(PK, FK)
* Organisation
    * organisationId(PK)
    * name
    * description
    * address
    * contactInfo
* HeroOrganisation
    * heroId(PK, FK)
    * organisationId(PK, FK)
* Location
    * locationId(PK)
    * name
    * description
    * adressInfo
    * latitude
    * longitude
* Sighting
    * sightingId(PK)
    * locationId(FK)
    * date
* HeroSighting
    * heroId(PK, FK)
    * sightingId(PK, FK)

# 2NF, 3NF & Attribute Data Types
2NF refers to entities with composite keys not containing non-key fields. Our entities already conform
to this, so we are in 2NF.

For 3NF we need to look at each entity and look at each non-key field of that entity. For each of these
fields we need to determine whether it depends on a field other than the primary key. The only one
that stands out is the address and contact fields of organisation. It is conceivable that we would add
a contact info table or also connect the address to the location table but this is not required for the
functionality we need and adds unnecessary complexity.

We list our final entities and fields below along with their respective data types and if they are
required or not. Fields in bold are required (NOT NULL):
* hero
    * **heroId(PK) – int**
    * **heroName – varchar(50)**
    * heroDescription – varchar(100)
* superpower
    * **powerId(PK) – int**
    * **powerName – varchar(25)**
    * powerDescription – varchar(100)
* heroSuperpower
    * **heroId(PK, FK) – int**
    * **powerId(PK, FK) – int**
* organisation
    * **organisationId(PK) – int**
    * **organisationName – varchar(25)**
    * organisationDescription – varchar(100)
    * address – varchar(50)
    * contactInfo – varchar(50)
* heroOrganisation
    * **heroId(PK, FK) – int**
    * **organisationId(PK, FK) – int**
* location
    * **locationId(PK) – int**
    * **locationName – varchar(50)**
    * **latitude – decimal(8, 6)**
    * **longitude – decimal(9, 6)**
    * locationDescription – varchar(100)
    * addressInfo – varchar(50)
* sighting
    * **sightingId(PK) – int**
    * **locationId(FK) – int**
    * **date – datetime**
* heroSighting
    * **heroId(PK, FK) – int**
    * **sightingId(PK, FK) - int**

# ERD
![alt text](https://github.com/karlwhelan62/superhero-sightings-java-spring-web-app/database/main/superherosightingsERD.png?raw=true)   