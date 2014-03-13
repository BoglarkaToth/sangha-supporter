Ext.application({
    requires: ['Ext.container.Viewport',
    'Ext.tab.Panel'],

    name: 'sanghaSupporter', 

    appFolder: 'app',

    controllers: [
    'Main'
    ],    

    views: [
    'filters.Tree',
    'supporter.Form',
    'supporter.Grid'
    ],

    launch: function () {     
    // This is the supporterViewport   
    var supporterViewport =  Ext.create('Ext.container.Viewport', {
        padding: 0,
        layout: {
            type: 'border',
            split: 'true',
            bodyStyle: 'padding: 10px'
        },
        items: [
        {                   
            region: 'north',
            xtype : 'toolbar',
            docked: 'top',                    
            items : [
            { xtype: 'tbtext', 
            text: 'Pártolói Alkalmazás' },
            { xtype: 'tbseparator' },
            { text: 'Főmenü',                      
            menu: { xtype: 'menu',
            plain: true,
            items: [{
                xtype: 'buttongroup',
                title: 'Szerkesztő módok',
                autoWidth: true,                   
                defaults: {
                    xtype: 'button',
                    scale: 'medium'
                },
                items: [{
                    text: 'Pártoló nézet',
                    handler: changeViewport,
                    id: 'supporter-btn'                                    
                },{
                    text: 'Naptár nézet',
                    handler: changeViewport,
                    id: 'calendar-btn'                       
                }]
            }]
        }        
    }        
    ]        
    },{
        xtype: 'filterstree',
        collapsible: true,
        region: 'west',
        margins: '5 0 0 0',
        cmargins: '5 5 0 0',
        width: 175,
        minSize: 100,
        maxSize: 250
    }, {
        xtype: 'panel',
        id: 'supporterPanel',
        collapsible: false,
        region:'center',
        margins: '5 0 0 0',
        layout: {
            type: 'vbox',
            align: 'stretch'
        },
        items: [{
            xtype: 'supportergrid',
            flex: 7
        }, {
            xtype: 'supporterform',
            flex: 3
        }]
    }
    ]            
    });  
    // This is the end of the supporterViewport

    function changeViewport() {
        if (this.getId() === 'supporter-btn') {
           Ext.getCmp('#supporterPanel').show();
           console.log('shooT');
        }
        else {                      
            Ext.getCmp('#supporterPanel').destroy();
        }
    }
}    
});