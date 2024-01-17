using { sap.capire.incidents as my } from '../db/schema';

service ProcessorService { 
  entity Incidents as projection on my.Incidents;
  entity Customers as projection on my.Customers;
  entity Conversations as projection on my.Conversations;
  entity Urgency as projection on my.Urgency;
  entity Status as projection on my.Status;
}
annotate ProcessorService.Incidents with @odata.draft.enabled; 
annotate ProcessorService with @(requires: ['support']);
extend projection ProcessorService.Customers with {
  firstName || ' ' || lastName as name: String
}