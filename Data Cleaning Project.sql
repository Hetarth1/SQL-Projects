SELECT * 
FROM layoffs;

DROP TABLE IF EXISTS layoffs_staging;

INSERT INTO layoffs_staging
SELECT * 
FROM layoffs;

SELECT * 
FROM layoffs_staging;

CREATE TABLE layoffs_staging2 (
  company TEXT,
  location TEXT,
  industry TEXT,
  total_laid_off INT,
  percentage_laid_off TEXT,
  date TEXT,
  stage TEXT,
  country TEXT,
  funds_raised_millions INT,
  row_num INT
);

INSERT INTO layoffs_staging2
SELECT *
FROM (
  SELECT *,
         ROW_NUMBER() OVER (
           PARTITION BY company, location, industry, total_laid_off, date, stage, country, funds_raised_millions
           ORDER BY company
         ) AS row_num
  FROM layoffs_staging
) AS derived
WHERE row_num = 1;

SELECT * 
FROM layoffs_staging2;

SELECT company, TRIM(company)
FROM layoffs_staging2;

UPDATE layoffs_staging2
SET company = TRIM(company);

SELECT DISTINCT(industry)
FROM layoffs_staging2
ORDER BY 1;

SELECT *
FROM layoffs_staging2
WHERE industry LIKE 'Crypto%';

UPDATE layoffs_staging2
SET industry = 'Crypto'
WHERE industry LIKE 'Crypto%';

SELECT distinct country, TRIM(TRAILING '.' FROM country)
FROM layoffs_staging2
ORDER BY 1;

UPDATE layoffs_staging2
SET country = TRIM(TRAILING '.' FROM country)
WHERE country LIKE 'United States%';

SELECT `date`,
str_to_date(`date`, '%m/%d/%Y')
FROM layoffs_staging2;

UPDATE layoffs_staging2
SET `date` = str_to_date(`date`, '%m/%d/%Y');

ALTER TABLE layoffs_staging2
MODIFY COLUMN `date` DATE;

UPDATE layoffs_staging2
SET industry = NULL
WHERE industry ='';

SELECT *
FROM layoffs_staging2
WHERE industry is NULL
OR industry = '';

SELECT *
FROM layoffs_staging2
WHERE company = 'Carvana';

SELECT t1.industry, t2.industry
FROM layoffs_staging2 t1
JOIN layoffs_staging2 t2
	ON t1.company = t2.company
WHERE t1.industry IS NULL
AND t2.industry IS NOT NULL;

UPDATE layoffs_staging2 t1
JOIN layoffs_staging2 t2
	ON t1.company = t2.company
SET t1.industry = t2.industry
WHERE t1.industry IS NULL
AND t2.industry IS NOT NULL;

SELECT *
FROM layoffs_staging2
WHERE total_laid_off is NULL
AND percentage_laid_off is NULL;

DELETE
FROM layoffs_staging2
WHERE total_laid_off is NULL
AND percentage_laid_off is NULL;

SELECT * 
FROM layoffs_staging2;

ALTER TABLE layoffs_staging2
DROP COLUMN row_num;