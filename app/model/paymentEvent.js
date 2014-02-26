Ext.define('sanghaSupporter.model.Supporter',{
    extend : 'Ext.data.Model',
    fields : [
        { name : 'ammount'  , type : 'int' },
        { name : 'date'     , type : 'datetime'},
        { name : 'currency' , type : 'string' },
        { name : 'method'   , type : 'string' },
        { name : 'type'     , type : 'string' },
        { name : 'library'  , type : 'boolean'},
        { name : 'bycicle'  , type : 'boolean' },
        { name : 'gym'      , type : 'boolean' },
        { name : 'motorpark', type : 'boolean' },
        { name : 'carpark'  , type : 'boolean' },
    ],
    validations : [
        { type : 'presence' , field : 'amount'  },
        { type : 'presence' , field : 'date' },
        { type : 'presence' , field : 'currency'},
        { type : 'presence' , field : 'method'},
        { type : 'presence' , field : 'type'}
    ]    
});