Ext.define('sanghaSupporter.view.supporter.Grid' ,{
    extend: 'Ext.grid.Panel',
    alias: 'widget.supportergrid',
    
    title: 'Buddhisták',
    
    columns: [{
        text: 'Név',
        dataIndex: 'name',
        flex: 1
    }, {
        text: 'Email',
        dataIndex: 'email',
        flex: 1
    }, {
        text: 'Státusz',
        dataIndex: 'status',
        flex: 1
    }, {
        text: 'Csipogó',
        dataIndex: 'beeper',
        flex: 1
    }, {
        text: 'Telefon',
        dataIndex: 'phone',
        flex: 1
    }, {
        text: 'Cím',
        dataIndex: 'address',
        flex: 1
    }, {
        text: 'Centrum',
        dataIndex: 'center',
        flex: 1
    }],
    
    store: 'Supporter',
    
    initComponent: function() {
        this.callParent(arguments);
    }
});
            