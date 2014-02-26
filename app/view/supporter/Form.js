Ext.define('sanghaSupporter.view.supporter.Form', {
    extend: 'Ext.form.Panel',
    alias: 'widget.supporterform',

    margin: '0 0 0 0',

    title: 'Támogató szerkesztése',

    defaults: {
        minWidth: 200,
        labelWidth: 90,
        border: false,
        padding: 10
    },

    defaultType: 'textfield',
    layout: {
        type: 'table',
        columns: 4
    },
    items: [{
        fieldLabel: 'Név',
        name: 'name',
           }, {
        fieldLabel: 'Email',
        name: 'email'
           }, {
        xtype: 'combo',
        fieldLabel: 'Státusz',
        name: 'status',       
        store: new Ext.data.SimpleStore ({
            data: [
                    ['supporter', 'Támogató'],
                    ['member', 'Tag'],
                    ['inactive', 'Inaktív']
            ],
            id: 0,
            fields: ['value', 'text']
        }),
               valueField: 'value',
               displayField: 'text',
               triggerAction: 'all',
               editable: false
           },{
               fieldLabel: 'Csipogó',
               name: 'beeper'
           },{
               fieldLabel: 'Telefon',
               name: 'phone'
           },{
               fieldLabel: 'Cím',
               name: 'address',
           },{
               fieldLabel: 'Centrum',
               name: 'center'
           }
           ],
        buttons:
        [{
            text: 'Mentés',
            scale: 'medium',
            margin: '10 30 10 0',
            formBind: true,
            handler: function (btn, evt) { 
            var form = this.up('form').getForm();
            form.updateRecord();
            }
        }]
});