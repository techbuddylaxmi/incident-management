using ProcessorService as service from '../../srv/service';

annotate service.Incidents with @(
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Value : title,
        },
        {
            $Type : 'UI.DataField',
            Value : customer.name,
            Label : 'name',
        },
        {
            $Type : 'UI.DataField',
            Label : 'urgency_code',
            Value : urgency_code,
            Criticality : status.criticality,
        },
        {
            $Type : 'UI.DataField',
            Label : 'status_code',
            Value : status_code,
        },
    ]
);
annotate service.Incidents with {
    customer @Common.ValueList : {
        $Type : 'Common.ValueListType',
        CollectionPath : 'Customers',
        Parameters : [
            {
                $Type : 'Common.ValueListParameterInOut',
                LocalDataProperty : customer_ID,
                ValueListProperty : 'ID',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'firstName',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'lastName',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'email',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'phone',
            },
        ],
    }
};
annotate service.Incidents with @(
    UI.FieldGroup #GeneratedGroup1 : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : title,
            },
            {
                $Type : 'UI.DataField',
                Label : 'urgency_code',
                Value : urgency_code,
            },
            {
                $Type : 'UI.DataField',
                Label : 'status_code',
                Value : status_code,
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.CollectionFacet',
            Label : 'Overview',
            ID : 'Overview',
            Facets : [
                {
                    $Type : 'UI.ReferenceFacet',
                    Label : 'General Information',
                    ID : 'GeneralInformation',
                    Target : '@UI.FieldGroup#GeneralInformation',
                },
                {
                    $Type : 'UI.ReferenceFacet',
                    Label : 'Details',
                    ID : 'Details',
                    Target : '@UI.FieldGroup#Details',
                },],
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'conversations',
            ID : 'conversations',
            Target : 'conversations/@UI.LineItem#conversations',
        },]
);
annotate service.Incidents with @(
    UI.SelectionFields : [
        status_code,
        urgency_code,
    ]
);
annotate service.Incidents with {
    status @Common.Label : 'status_code'
};
annotate service.Incidents with {
    urgency @Common.Label : 'urgency_code'
};
annotate service.Incidents with @(
    UI.HeaderInfo : {
        Title : {
            $Type : 'UI.DataField',
            Value : title,
        },
        TypeName : '',
        TypeNamePlural : '',
        Description : {
            $Type : 'UI.DataField',
            Value : customer.name,
        },
    }
);
annotate service.Incidents with @(
    UI.FieldGroup #GeneralInformation : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : title,
            },{
                $Type : 'UI.DataField',
                Value : customer.name,
                Label : 'name',
            },],
    }
);
annotate service.Incidents with @(
    UI.FieldGroup #Details : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : status_code,
            },{
                $Type : 'UI.DataField',
                Value : urgency_code,
            },],
    }
);
annotate service.Conversations with @(
    UI.LineItem #conversations : [
        {
            $Type : 'UI.DataField',
            Value : author,
            Label : 'author',
        },{
            $Type : 'UI.DataField',
            Value : message,
            Label : 'message',
        },{
            $Type : 'UI.DataField',
            Value : timestamp,
            Label : 'timestamp',
        },]
);
