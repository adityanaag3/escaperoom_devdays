public with sharing class OrderCreator {
    public static void createOrders(){
        // Create Reseller Order Records
        List<Account> acc = [select Id, Name from Account];
        List<Order__c> ordersToCreate = new List<Order__c>();

        DateTime baseDate = DateTime.newInstance(2023, 7, 20, 19, 0, 0);

        // For Wheelworks, Trailblazers, Northern Trail Cycling
        for(Account a : acc){
            if(a.Name == 'Wheelworks'){
                // :::: 100 production orders for 24 Jul
                ordersToCreate.addAll(OrderCreator.addOrders(80, 'In Production', a.Id, baseDate));
                // :::: 180 for Day 1
                ordersToCreate.addAll(OrderCreator.addOrders(44, 'In Production', a.Id, baseDate.addDays(1)));
                // 40 for Day 2
                ordersToCreate.addAll(OrderCreator.addOrders(38, 'In Production', a.Id, baseDate.addDays(2)));
                // ::::: 300 for Day 3
                ordersToCreate.addAll(OrderCreator.addOrders(87, 'In Production', a.Id, baseDate.addDays(3)));
                // :::::: 320 for Day 4
                ordersToCreate.addAll(OrderCreator.addOrders(56, 'In Production', a.Id, baseDate.addDays(4)));
                // 280 for Day 5
                ordersToCreate.addAll(OrderCreator.addOrders(40, 'In Production', a.Id, baseDate.addDays(5)));
                // 260 for Day 6
                ordersToCreate.addAll(OrderCreator.addOrders(10, 'In Production', a.Id, baseDate.addDays(6)));
                // 170 for Day 7
                ordersToCreate.addAll(OrderCreator.addOrders(91, 'In Production', a.Id, baseDate.addDays(7)));


                ordersToCreate.addAll(OrderCreator.addOrders(102, 'Draft', a.Id, baseDate));
                ordersToCreate.addAll(OrderCreator.addOrders(130, 'Approved by Manufacturing', a.Id, baseDate.addDays(2)));

                ordersToCreate.addAll(OrderCreator.addOrders(44, 'Draft', a.Id, baseDate.addDays(3)));
                ordersToCreate.addAll(OrderCreator.addOrders(209, 'Approved by Manufacturing', a.Id, baseDate.addDays(3)));

                ordersToCreate.addAll(OrderCreator.addOrders(315, 'Draft', a.Id, baseDate));
                ordersToCreate.addAll(OrderCreator.addOrders(88, 'Approved by Manufacturing', a.Id, baseDate.addDays(6)));

            } else if(a.Name == 'Trailblazers'){

                // :::: 100 production orders for 24 Jul
                ordersToCreate.addAll(OrderCreator.addOrders(309, 'In Production', a.Id, baseDate));
                // :::: 180 for Day 1
                ordersToCreate.addAll(OrderCreator.addOrders(207, 'In Production', a.Id, baseDate.addDays(1)));
                // 40 for Day 2
                ordersToCreate.addAll(OrderCreator.addOrders(254, 'In Production', a.Id, baseDate.addDays(2)));
                // ::::: 300 for Day 3
                ordersToCreate.addAll(OrderCreator.addOrders(356, 'In Production', a.Id, baseDate.addDays(3)));
                // :::::: 320 for Day 4
                ordersToCreate.addAll(OrderCreator.addOrders(132, 'In Production', a.Id, baseDate.addDays(4)));
                // 280 for Day 5
                ordersToCreate.addAll(OrderCreator.addOrders(179, 'In Production', a.Id, baseDate.addDays(5)));
                // 260 for Day 6
                ordersToCreate.addAll(OrderCreator.addOrders(324, 'In Production', a.Id, baseDate.addDays(6)));
                // 170 for Day 7
                ordersToCreate.addAll(OrderCreator.addOrders(177, 'In Production', a.Id, baseDate.addDays(7)));


                ordersToCreate.addAll(OrderCreator.addOrders(210, 'Draft', a.Id, baseDate));
                ordersToCreate.addAll(OrderCreator.addOrders(12, 'Approved by Manufacturing', a.Id, baseDate.addDays(1)));

                ordersToCreate.addAll(OrderCreator.addOrders(98, 'Draft', a.Id, baseDate.addDays(3)));
                ordersToCreate.addAll(OrderCreator.addOrders(43, 'Approved by Manufacturing', a.Id, baseDate.addDays(6)));

                ordersToCreate.addAll(OrderCreator.addOrders(32, 'Draft', a.Id, baseDate));
                ordersToCreate.addAll(OrderCreator.addOrders(55, 'Approved by Manufacturing', a.Id, baseDate.addDays(7)));

            } else if(a.Name == 'Northern Trail Cycling'){

                // :::: 100 production orders for 24 Jul
                ordersToCreate.addAll(OrderCreator.addOrders(100, 'In Production', a.Id, baseDate));
                // :::: 180 for Day 1
                ordersToCreate.addAll(OrderCreator.addOrders(180, 'In Production', a.Id, baseDate.addDays(1)));
                // 40 for Day 2
                ordersToCreate.addAll(OrderCreator.addOrders(40, 'In Production', a.Id, baseDate.addDays(2)));
                // ::::: 300 for Day 3
                ordersToCreate.addAll(OrderCreator.addOrders(300, 'In Production', a.Id, baseDate.addDays(3)));
                // :::::: 320 for Day 4
                ordersToCreate.addAll(OrderCreator.addOrders(320, 'In Production', a.Id, baseDate.addDays(4)));
                // 280 for Day 5
                ordersToCreate.addAll(OrderCreator.addOrders(280, 'In Production', a.Id, baseDate.addDays(5)));
                // 260 for Day 6
                ordersToCreate.addAll(OrderCreator.addOrders(260, 'In Production', a.Id, baseDate.addDays(6)));
                // 170 for Day 7
                ordersToCreate.addAll(OrderCreator.addOrders(170, 'In Production', a.Id, baseDate.addDays(7)));


                ordersToCreate.addAll(OrderCreator.addOrders(30, 'Draft', a.Id, baseDate));
                ordersToCreate.addAll(OrderCreator.addOrders(90, 'Approved by Manufacturing', a.Id, baseDate.addDays(5)));

                ordersToCreate.addAll(OrderCreator.addOrders(44, 'Draft', a.Id, baseDate.addDays(3)));
                ordersToCreate.addAll(OrderCreator.addOrders(51, 'Approved by Manufacturing', a.Id, baseDate.addDays(1)));

                ordersToCreate.addAll(OrderCreator.addOrders(98, 'Draft', a.Id, baseDate));
                ordersToCreate.addAll(OrderCreator.addOrders(10, 'Approved by Manufacturing', a.Id, baseDate.addDays(4)));

            }
        }
        insert ordersToCreate;
    }

    private static List<Order__c> addOrders(Integer qty, String status, String accountId, DateTime createdDate){
        List<Order__c> tmpList = new List<Order__c>();
        for(Integer i = 0; i < qty; i++){
            Order__c o = new Order__c();
            o.Status__c = status;
            o.Account__c = accountId;
            o.CreatedDate = createdDate;
            tmpList.add(o);
        }
        return tmpList;
    }
}