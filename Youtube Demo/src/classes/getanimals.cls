public class getanimals {
    public List<String> an{get;set;} 
    public getanimals(){
    /*Http http = new Http();
    HttpRequest request = new HttpRequest();
    request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals');
    request.setMethod('GET');
    HttpResponse response = http.send(request);*/
    // If the request is successful, parse the JSON response.
    //if (response.getStatusCode() == 200) {
    // Deserialize the JSON string into collections of primitive data types.
     JSON2Apex obj=  JSON2Apex.parse('{"animals":["cvh","fluffy bunny","scary bear","chicken"]}');
     an=obj.animals;
     //}
}

}