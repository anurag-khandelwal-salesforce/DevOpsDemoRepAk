@isTest
public class SetDateForReservationTest {
    @isTest
    static void testSetDateOnReservation() {
        // Create a test reservation record
        reservation__c testReservation = new reservation__c(Name = 'Test Reservation');
        insert testReservation;
        // Retrieve the inserted reservation
        testReservation = [SELECT Id, Name, Reservation_Date__c FROM reservation__c WHERE Id = :testReservation.Id LIMIT 1];
        // Prepare the input list for the InvocableMethod
        List<reservation__c> inputList = new List<reservation__c>{testReservation};
            // Call the InvocableMethod
            List<reservation__c> result = SetDateForReservation.setDateOnReservation(inputList);
        // Verify the result
        System.assertNotEquals(null, result, 'Result should not be null');
        System.assertEquals(1, result.size(), 'Result list should contain one reservation');
        System.assertEquals(System.today(), result[0].Reservation_Date__c, 'Reservation_Date__c should be set to today');
        // Verify the reservation record in the database
        testReservation = [SELECT Id, Name, Reservation_Date__c FROM reservation__c WHERE Id = :testReservation.Id LIMIT 1];
        System.assertEquals(System.today(), testReservation.Reservation_Date__c, 'Reservation_Date__c should be set to today in the database');
    }
}