public with sharing class OfferCodeCtrl {
    
    @AuraEnabled
    public static String getOfferCode(){
        HttpRequest req = new HttpRequest();
        req.setEndpoint('callout:Offers_Endpoint'+ '/api/offercode?fromCode=true');
        req.setMethod('GET');
        Http http = new Http();
        HTTPResponse response = http.send(req);

        if(response.getStatusCode() == 200){
           // Parse the response JSON
            Map<String, Object> responseData = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
            String offerCode = (String) responseData.get('offerCode');
            return offerCode;
        }

        return null;
    }
}