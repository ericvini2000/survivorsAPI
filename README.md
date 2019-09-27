# SurvivorsAPI
This API was made to share resources between non-abducted humans and have the following resources:

Survivors API - Documentation
Eric Vinícius A. de Lima
Updated at: 27/09/2019

The world as we know it has fallen into an apocalyptic scenario. An alien invasion is abducting humans and swapping them for evil clones that look really similar to the original person.
This API was made to share resources between non-abducted humans and have the following resources:

 - Add survivors to the database
        With PostMan  
        Set your requisition to POST method
        Put on your URL the following: localhost:3000/survivors 
        On Headers menu, select on Key field the option Content-Type and on the field Value, set to application/json
        On Body menu, select the option raw and write in json format the attributes of the new Survivor like the example below:
        Click on Send and if Success, you will see one JSON with the new Survivor registered and your attributes 
        "name": # Represents the name of the new survivor - String
        "age": #Represents the age of the new survivor - Integer
        "lat": # Represents the current latitude of the new survivor - float
        "long": #Represents the current longit. of the new survivor - float
        "gender": # Represents the gender of the new survivor with the following logic: 0 to Female and 1 to Male - Integer     

Example JSON:
{
        "name": "Daniel Orivaldo da Silva",
        "age": 35,
        "lat": -23.4273,
        "long": -51.9375,
        "gender": 1        
}

- Update Survivor Localization
        With PostMan  
        Set your requisition to PUT method
        Change your URL to add the Valid ID of the survivor that you want to update the localization like this:   localhost:3000/survivors/15 
        On Headers menu, select on Key field the option Content-Type and on the field Value, set to application/json
        On Body menu, select the option raw and write in json format the attributes of the new localization of the Survivor like the example below:
        Click on Send and you will see one JSON with the Survivor and your new attributes 

Example JSON:
{
            "lat": -23.4273,
        "long": -51.9375      
}

- Get All Survivors 
        With PostMan  
        Set your requisition to GET method
        Change your URL to only /survivor like this: localhost:3000/survivors 
        Click on Send and you will see one JSON with the all survivors ordered by alphabetic order and your current attributes

 - Report Abduction
        With PostMan  
        Set your requisition to PUT method
        Change your URL to add the route /report_abd  and a Valid ID of the survivor that you want report the abduction like this: localhost:3000/survivors/report_abd/15 
        On Headers menu, select on Key field the option Content-Type and on the field Value, set to application/json
        On Body menu, select the option raw and write in json format the ID of the Survivor who is reporting the abduction like the example below.
        Click on Send and you will see one JSON with the Survivor and your new attributes 

Example JSON:
{
            "idDenunciante": 4     
}

NOTE:
Whenever a survivor receives 3 or more reports of other valid survivors, it will be treated as abducted.

 - Percentage of Survivors Abducted
        With PostMan  
        Set your requisition to GET method
        Change your URL to only /percent_abd like this: localhost:3000/survivors/percent_abd
        Click on Send and you will see one JSON with the percentage of the survivors with attribute Abducted: True by the total  of Survivors.

 - Percentage of Survivors Abducted
        With PostMan  
        Set your requisition to GET method
        Change your URL to only /percent_non_abd like this: localhost:3000/percent_non_abd
        Click on Send and you will see one JSON with the percentage of the survivors with attribute Abducted: False by the total of Survivors.

 - Other Informations:
The DB used for this API was the PostGreSQL
    
Contact: ericvinicius_97@hotmail.com







