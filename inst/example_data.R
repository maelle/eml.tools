library("EML")

# create the example data
data <- data.frame(animal = c(rep("A", 10), rep("B", 10)),
                   age = c(rep("A", 5), rep("B", 5), rep("A", 5), rep("B", 5)),
                   size = c(rnorm(mean = 50, n = 5),
                            rnorm(mean = 80, n = 5),
                            rnorm(mean = 10, n = 5),
                            rnorm(mean = 20, n = 5)))

# attributesList
attributes <-
  data.frame(
    attributeName = c(
      "animal",
      "age",
      "size"),
    attributeDefinition = c(
      "animal species",
      "life stage",
      "body length"),
    formatString = c(
      NA,
      NA,
      NA),
    definition = c(
      "animal species",
      "life stage",
      "body length"),
    unit = c(
      NA,
      NA,
      "meter"),
    numberType = c(
      NA,
      NA,
      "real"),
    stringsAsFactors = FALSE
  )

# two of the attributes are factors
animal.codes <- c(A = "cat_monster",
                  B = "dog_monster")
age.codes <- c(A = "juvenile",
               B = "adult")
factors <- rbind(
  data.frame(
    attributeName = "animal",
    code = names(animal.codes),
    definition = unname(animal.codes)
  ),
  data.frame(
    attributeName = "age",
    code = names(age.codes),
    definition = unname(age.codes)
  ))


attributeList <- set_attributes(attributes,
                                factors,
                                col_classes = c("factor", "factor", "numeric"))

# physical
physical <- set_physical("doesntexist.csv")

# datatable
dataTable <- new("dataTable",
                 entityName = "doesntexist.csv",
                 entityDescription = "tipping point experiment 1",
                 physical = physical,
                 attributeList = attributeList)

# coverage

geographicDescription <- "Nowhere real, thankfully given the size of these animals."


coverage <-
  set_coverage(begin = '2016-10-01', end = '2016-10-31',
               sci_names = "Monstri monstri",
               geographicDescription = geographicDescription,
               west = 0, east = 0,
               north = 0, south = 0,
               altitudeMin = 160, altitudeMaximum = 330,
               altitudeUnits = "meter")

# abstract & co
pubDate <- "2016"

title <- "Test dataset"

abstract <- "Test dataset and eml to write a function for translating factors"

intellectualRights <- "Free to use"

# parties
R_person <- as.person("The Dataset Creator <fakeaddress@email.com>")
creator <- as(R_person, "creator")

# dataset
methods <- "invented"
dataset <- new("dataset",
               title = title,
               creator = creator,
               pubDate = pubDate,
               methods = set_methods(paste0(getwd(), "/inst/extdata/methods.txt")),
               intellectualRights = intellectualRights,
               abstract = abstract,
               coverage = coverage,
               contact = creator,
               dataTable = dataTable)

# the function should return column names that look like the code column names,
# not definition for all!


eml <- new("eml",
           packageId = "is",
           system = "uuid", # type of identifier
           dataset = dataset)
eml_validate(eml)
write_eml(eml, file = paste0(getwd(), "/inst/extdata/example.xml"))
