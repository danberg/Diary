# Dagbonk #
Den här uppgiften går ut på att skriva ett program som kan lista, skriva ut, och skapa dagboksinlägg

## Bedömningsmatris ##

### Planering ###

| Förmågor                         | E 																																   | C | A |
|----------------------------------|-----------------------------------------------------------------------------------------------------------------------------------|---|---|
| Anpassning					   | Du anpassar med viss säkerhet planeringen till uppgiften 																		   |   | Som för E, men med säkerhet
| Utformning                       | Du väljer med viss säkerhet lämpliga kontrollstrukturer, metoder, variabler, datastrukturer och algoritmer | | Som för E, men du väljer med säkerhet, och motiverar utförligt dina val.|
| Utvärdering | Med viss säkerhet utvärderar du, med enkla omdömen, programmets prestanda, använder datalogiska begrepp, och bedömer din egen förmåga | som för E, men med nyanserade omdömen | Som för C, men med säkerhet, och med förbättringsförslag

### Syntax och Teori ###
| Förmågor                                       | E 																			| C | A |
|------------------------------------------------|------------------------------------------------------------------------------|---|---|
| Datatyper					                     | Du kan redogöra för och använda de vanligaste datatyperna                    |   |   |
| Grundläggande syntax		                     | Du kan redogöra för och använda programmeringsspråkets grundläggande syntax  |   |   |
| Villkor och IF-satser		                     | Du kan redogöra för och använda villkor och IF-satser                        |   |   |
| Loopar & iteration                             | Du kan redogöra för och använda loopar och iterera över listor               |   |   |

### Kodning och kodningsstil ###

| Förmågor                                      | E                                                                         | C                                               | A                                              |
|-----------------------------------------------|---------------------------------------------------------------------------|-------------------------------------------------|------------------------------------------------|
| Komplexitet									| Du kan skriva enkla program                                               | Du kan skriva lite mer avancerade program       | Du kan skriva komplexa program
| Sekventiell- & funktionsbaserad programmering | Du använder dig av sekventiell programmering och fördefinerade funktioner | Du skapar och använder enkla funktioner         | Du skapar mer komplexa funktioner              |
| Objektorienterad programmering                | Du använder dig av av fördefinerade klasser och objekt                    | Du skapar och använder enkla klasser och objekt | Du skapar och använder mer komplicerade klasser och objekt  |
| Struktur		 				                | Du skriver kod som är delvis strukturerad, har en konsekvent kodningsstil och tydlig namngivning | Som för E, men du skriver kod som är helt strukturerad |   			   |
| Felsökning                                    | Du felsöker på egen hand enkla syntaxfel | Som för E, men systematiskt, och dessutom även körtidsfel och programmeringslogiska fel | Som för C, men med effektivitet   	   |
| Undantagshantering                            |     																		| Du validerar användardata						  | Som för C, men du skriver även kod som använder undantagshantering |
| Dokumentering 								| Du skriver kod som är delvis kommenterad									|  												  | Du skriver kod som är utförligt kommenterad    |

### Datastrukturer ###

| Förmågor        | E 														   | C 																     | A 									 |
|-----------------|------------------------------------------------------------|---------------------------------------------------------------------|---------------------------------------|
| Listor          | Du kan redogöra för och använda dig av listor (Array)      |   																     |   									 |
| Hashtabeller    | Du kan redogöra för vad hashtabeller (Hash) är             | Du kan använda dig av hashtabeller 							     |   									 |

## Beskrivning ##


### Funktioner ###

I den här uppgiften kommer du bygga flera funktioner som arbetar tillsammans:

#### create_diary_submission_file ####

Tar emot en sökväg och ett namn på dagboksinlägget, skapar en fil med namnet  + filändelsen .diary,
och returnerar filen

#### write_to_diary ####

Tar emot en sökväg till en .diary-fil, och en textsträng med innehållet som ska skrivas till filen,
och skriver innehållet i textsträngen till filen

#### create_diary_list ####

Tar emot en sökväg till mappen där dagboksinläggen finns, och returnerar en lista med sökvägar till alla dagboksinlägg.

#### print_diary_list ####

Tar emot en lista med sökvägar till dagboksinlägg, och skriver ut en formaterad & numrerad lista över dagboksinläggen

#### print_diary ####

Tar emot en sökväg till ett dagboksinlägg, och skriver ut innehållet inklusive inläggets namn.

#### main ####

main saknar tester, och är upp till dig att uforma, men den ska återanvända ovanstående funktioner.
Det är fritt fram (och uppmuntras) att skapa egna ytterligare funktioner som gör programmet lättare att förstå.


Den ska ochså presentera följande gränssnitt för användaren.

##### Huvudmeny #####

När programmet startar ska användaren mötas av följande meny

    What would you like to do?
    1: List entries
    2: Write entries
    Anything else to quit

Om användaren trycker på 1 (och enter) ska programmet visa [Listningsmenyn](#listningsmeny).

Om användaren trycker på 2 (och enter) ska programmet visa [Skapa-menyn](#skapameny)

##### <a name='listningsmeny'></a> Listningsmenyn ####

När användaren väljer att visa inläggsmenyn skrivs något liknande nedanstående ut

    Enter number of entry to read
    1: Another Entry
    2: My First Submission

När användaren väljer ett av inläggen ska inlägget skrivas ut på skärmen.
I nedanstående exempel har användaren tryckt på 1 (och enter):

    Another Entry

    What are you looking at!?
    Go back to writing the program!

Om användaren väljer ett ogilitigt nummer ska listan visas igen, och användaren uppmuntras att välja ett giltigt nummer.
I nedanstående exempel har användaren tryckt på 3 (och enter):

    Please pick a file in the list
    1: Another Entry
    2: My First Submission

Efter utskriften avslutas programmet.

##### <a name='skapameny'></a> Skapa-menyn ####

Om användaren från huvudmenyn väljer alternativ 2 ska följande visas:

    Name of diary entry:

Användaren får sen skriva in namnet på dagboksinlägget (t.ex 'Programmeringsprov')

När användaren tryckt på enter får han mata in text till inlägget. Användaren ska få mata in flera
rader med text. Textinmatningen avslutas genom att användaren på en tom rad skriver 'quit'.
Exempel på hur detta kan se ut:

    Name of diary entry:
    Programmeringsprov

    Enter text, press enter for a new line. Type 'quit' on an empty line to finish entry

    Kära dagbok, idag
    har jag haft ett väldigt jobbigt
    prov.

    Dumma Daniel
    quit

När inmatningen avslutas med hjälp av 'quit' skrivs innehållet till filen. Observera att 'quit' *inte* ska skrivas in i filen.
Efter filen är skapad avslutas programmet.

## Genomförande ##

Programmet ska utvecklas testdrivet.

Jag föreslår att du utvecklar funktionerna i den ordning de står i listan ovan.
På så sätt behöver du, när det är dags att skriva main, bara lägga in anrop till dina redan skrivna funktioner i rätt ordning.

Skapa funktionerna i lib/diary.rb

Testerna finns i spec/diary_spec.rb.

Kör rspec köra testerna.

## Utvärdering ##

Efter programmet är avslutat ska du utvärdera hur projektet gick.





