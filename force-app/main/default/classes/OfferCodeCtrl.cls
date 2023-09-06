public without sharing class OfferCodeCtrl {
    
    @AuraEnabled
    public static String getOfferCode(){
        Product__c product = [SELECT
                Id,
                Charger__c
            FROM Product__c
            WHERE Name = 'FUSE X1'
        ];
        HttpRequest req = new HttpRequest();
        req.setEndpoint('callout:Offers_Endpoint'+ '/api/offercode?secret='+product.Charger__c);
        req.setMethod('GET');
        Http http = new Http();
        HTTPResponse response = http.send(req);

        if(response.getStatusCode() == 200){
            Map<String, Object> responseData = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
            String offerCode = (String) responseData.get('offerCode');
            return offerCode;
        }

        return null;
    }
}