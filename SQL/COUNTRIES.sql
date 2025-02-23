CREATE schema IF NOT EXISTS COUNTRIES;

CREATE table COUNTRIES.COUNTRIES(
	country_id INT,
    NAME VARCHAR(255),
    NATIONALITY VARCHAR(255),
    COUNTRY_CODE VARCHAR(3),
    ISO_ALPHA2 VARCHAR (2),
    CAPITAL VARCHAR(255),
    POPULATION INT,
    AREA_KM2 INT,
    REGION_ID INT,
    SUB_REGION_ID INT
);

INSERT INTO COUNTRIES.COUNTRIES (COUNTRY_ID, NAME, NATIONALITY, COUNTRY_CODE, ISO_ALPHA2, CAPITAL, POPULATION, AREA_KM2, REGION_ID, SUB_REGION_ID)
VALUES 
(1, 'Afghanistan', 'Afghan', 'AFG', 'AF', 'Kabul', 38041754, 652230, 30, 30),
(2, 'Albania', 'Albanian', 'ALB', 'AL', 'Tirana', 2880917, 28748, 20, 78),
(3, 'Algeria', 'Algerian', 'DZA', 'DZ', 'Algiers', 43053054, 2381741, 50, 40),
(4, 'American Samoa', 'American Samoan', 'ASM', 'AS', 'Pago Pago', 55312, 199, 48, 20),
(5, 'Andorra', 'Andorran', 'AND', 'AD', 'Andorra la Vella', 77142, 468, 28, 70),
(6, 'Angola', 'Angolan', 'AGO', 'AO', 'Luanda', 31825295, 1246700, 50, 160),
(7, 'Anguilla', 'Anguillan', 'AIA', 'AI', 'The Valley', 14869, 91, 10, 10),
(8, 'Antarctica', 'Antarctic', 'ATA', 'AQ', 'McMurdo Station', 1106, 14200000, 40, NULL),
(9, 'Antigua and Barbuda', 'Antiguan or Barbudan', 'ATG', 'AG', 'St. John\'s', 97118, 442, 10, 10),
(10, 'Argentina', 'Argentine', 'ARG', 'AR', 'Buenos Aires', 44780677, 2780400, 10, 10),
(11, 'Armenia', 'Armenian', 'ARM', 'AM', 'Yerevan', 2957731, 29743, 30, 170),
(12, 'Aruba', 'Aruban', 'ABW', 'AW', 'Oranjestad', 106314, 180, 10, 10),
(13, 'Australia', 'Australian', 'AUS', 'AU', 'Canberra', 25203198, 7692024, 40, 90),
(14, 'Austria', 'Austrian', 'AUT', 'AT', 'Vienna', 8955102, 83871, 20, 150),
(15, 'Azerbaijan', 'Azerbaijani', 'AZE', 'AZ', 'Baku', 10047718, 86600, 30, 170),
(16, 'Bahamas', 'Bahamian', 'BHS', 'BS', 'Nassau', 389482, 13943, 10, 10),
(17, 'Bahrain', 'Bahraini', 'BHR', 'BH', 'Manama', 1641172, 765, 38, 178),
(18, 'Bangladesh', 'Bangladeshi', 'BGD', 'BD', 'Dhaka', 163046161, 147570, 30, 30),
(19, 'Barbados', 'Barbadian', 'BRB', 'BB', 'Bridgetown', 287025, 430, 10, 10),
(20, 'Belarus', 'Belarusian', 'BLR', 'BY', 'Minsk', 9452411, 207600, 20, 140);


CREATE TABLE COUNTRIES.REGIONS(
      ID INT,
      NAME VARCHAR(255)
);

INSERT INTO COUNTRIES.REGIONS(ID,NAME)VALUES
      (10,'America'),
      (20, 'Europe'),
      (30, 'Asia'),
      (40,'osian'),
      (50,'afrika');
      
      
create table countries.sub_regions(
  ID INT,
  name varchar(255)
);

insert into countries.sub_regions(ID,name)
values
(10, 'Latin America and the Caribbean'),
    (20, 'Polynesia'),
    (30, 'Southern Asia'),
    (40, 'Northern Africa'),
    (50, 'Micronesia'),
    (60, 'Eastern Asia'),
    (70, 'Southern Europe'),
    (80, 'Northern America'),
    (90, 'Australia and New Zealand'),
    (100, 'South-eastern Asia'),
    (110, 'Central Asia'),
    (120, 'Northern Europe'),
    (130, 'Melanesia'),
    (140, 'Eastern Europe'),
    (150, 'Western Europe'),
    (160, 'Sub-Saharan Africa'),
    (170, 'Western Asia');
    
    select ID,name from countries.regions;
    select id,name from countries.sub_regions;
    
    use countries;
    select id,name from regions;
    select*,country_id from countries;
    
    -- aliasing name as country_name
    -- as it not compularsary it is used for readability
    
    select name as country_name from countries.countries;
    
    select country_id,name as 'country name',capital as 'capital city',population from countries;
    
    
    select region_ID from countries.countries;
    
    