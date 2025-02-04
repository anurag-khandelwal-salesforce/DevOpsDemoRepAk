public class SetDateForReservation {
      @InvocableMethod(label='Set Reservation Date' description='Reservation Date Set' category='Reservation')
    public static  list<reservation__c> setDateOnReservation(list<reservation__c> res)
    {
        list<reservation__c> returnReservation = new list<reservation__c>();
        reservation__c resFirst	= res[0];
        resFirst.Reservation_Date__c = system.today();
        returnReservation.add(resFirst);
        return returnReservation;
    }
}