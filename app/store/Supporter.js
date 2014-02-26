Ext.define('sanghaSupporter.store.Supporter', {
    extend: 'Ext.data.Store',
    model: 'sanghaSupporter.model.Supporter',
    
    data: {
        'items': [
             {
             'status': 'member',
             'name': 'Gautama',
             'email': 'gautama@dummyemail.hu',
             'beeper': '108',
             'phone': '111',
             'sms': 'true',
             'address': 'Nowhere Boulward',
             'center': 'Budapest'
          }, {
             'status': 'member',
             'name': 'Shariputra',
             'email': 'shariputra@noemail.com',
             'beeper': '116',
             'phone': '108',
             'sms': 'true',
             'address': 'Bodhgaya road',
             'center': 'Budapest'
          },  {
             'status': 'inactive',
             'name': 'John Doe',
             'email': 'johndoe@gmail.com',
             'beeper': '108',
             'phone': '0620123456',
             'sms': 'false',
             'address': 'High street',
             'center': 'Newcastle upon Tyne'},
            {
             'status': 'supporter',
             'name': 'Jane Doe',
             'email': 'janedoe@email.com',
             'beeper': '119',
             'phone': '111',
             'sms': 'false',
             'address': 'Fifth avenue',
             'center': 'New York'},
            {
             'status': 'supporter',
             'name': 'John Connor',
             'email': 'igetyou@skynet.com',
             'beeper': '120',
             'phone': '111',
             'sms': 'false',
             'address': 'Future street',
             'center': 'Debrecen'},
            {
             'status': 'supporter',
             'name': 'John Constantine',
             'email': 'johnnyboy@hellblazer.com',
             'beeper': '666',
             'phone': '104',
             'sms': 'false',
             'address': 'Newcastle',
             'center': 'Newcastle'}
            ]
    },
    
    proxy: {
        type: 'memory',
        reader: {
            type: 'json',
            root: 'items'
        }
    }
});