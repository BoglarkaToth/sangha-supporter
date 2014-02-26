Ext.define('sanghaSupporter.model.Supporter',{
    extend : 'Ext.data.Model',
    fields : [
        { name : 'status'  , type : 'string' },
        { name : 'name'    , type : 'string' },
        { name : 'email'   , type : 'string' },
        { name : 'beeper'  , type : 'int'    },
        { name : 'phone'   , type : 'string' },
        { name : 'sms'     , type : 'boolean'},
        { name : 'address' , type : 'string' },
        { name : 'center'  , type : 'string' }
    ],
    validations : [
        { type : 'presence' , field : 'name'  },
        { type : 'presence' , field : 'email' },
        { type : 'presence' , field : 'status'}
    ],
    hasMany : [
        { model : 'sanghaSupporter.model.paymentEvent', name : 'getPayments'}
    ]
});