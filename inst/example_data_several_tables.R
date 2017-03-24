library("EML")

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
animal.codes <- c(A = "monstercat",
                  B = "monsterdog")
age.codes <- c(A = "juvenile",
               B = "adult")
factors1 <- rbind(
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


attributeList1 <- set_attributes(attributes,
                                 factors1,
                                 col_classes = c("factor", "factor", "numeric"))
animal.codes <- c(A = "monstercat",
                  B = "monsterdog")
age.codes <- c(A = "petit",
               B = "grand")
factors2 <- rbind(
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


attributeList2 <- set_attributes(attributes,
                                 factors2,
                                 col_classes = c("factor", "factor", "numeric"))

# physical
physical <- set_physical("doesntexist.csv")

# datatable
dataTable1 <- new("dataTable",
                  entityName = "english_animals",
                  entityDescription = "tipping point experiment 1",
                  physical = physical,
                  attributeList = attributeList1)
dataTable2 <- new("dataTable",
                  entityName = "french_animals",
                  entityDescription = "tipping point experiment 1",
                  physical = physical,
                  attributeList = attributeList2)

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
R_person <- as.person("The Dataset Creator [cre] <fakeaddress@email.com>")
creator <- as(R_person, "creator")

associatedParty <- as.person("Another Contributor [ctb] <otherfakeadress@email.com>")
associatedParty <- as(associatedParty, "associatedParty")

# methods
methods_file <- paste0(getwd(), "/inst/extdata/methods.txt")
methods <- set_methods(methods_file)

# contact
HF_address <- new("address",
                  deliveryPoint = "324 North Main Street",
                  city = "Petersham",
                  administrativeArea = "MA",
                  postalCode = "01366",
                  country = "USA")
publisher <- new("publisher",
                 organizationName = "Harvard Forest",
                 address = HF_address)
contact <-
  new("contact",
      individualName = creator@individualName,
      electronicMail = creator@electronicMailAddress,
      address = HF_address,
      organizationName = "Harvard Forest",
      phone = "000-000-0000")

# dataset

dataset <- new("dataset",
               title = title,
               creator = creator,
               pubDate = pubDate,
               intellectualRights = intellectualRights,
               abstract = abstract,
               associatedParty = associatedParty,
               coverage = coverage,
               contact = contact,
               methods = methods,
               dataTable = list(dataTable1,
                                dataTable2))

# the function should return column names that look like the code column names,
# not definition for all!


animals_db_eml <- new("eml",
                   packageId = "is",
                   system = "uuid", # type of identifier
                   dataset = dataset)
eml_validate(animals_db_eml)
write_eml(animals_db_eml, file = paste0(getwd(), "/inst/extdata/db_example.xml"))
save(animals_db_eml, file = "data/animals_db_eml.RData")
