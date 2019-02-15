// sidebar
let vmSideBar =  new Vue({
    delimiters:['%%','%%'],
    el:'.main-sidebar',
    data:{
        fcs_status:false,
        TimeOut: null,
        visible:false,
    },
    methods:{
        modelStatus:function(){
            let self = this;
            $.post({
                url:'/models/?',
                data:{
                    show:'home',
                    ajax:'modelInfo'
                }
            })
            .done(function(data){
                let res = JSON.parse(data);

                if(res.fcs_status === '0'){
                    utils.fcsStatusCheck(false);
                }else if (res.fcs_status === '1'){
                    utils.fcsStatusCheck(true);
                }

                self.TimeOut = setTimeout(function () {
                    self.modelStatus();
                },3000)
            })
        }
    }
});
//header section only
let vm = new Vue({
   delimiters:['%%','%%'],
   el:'#header',
   data:{
       errMsg:"Test Error Message",
       mailList:[],
       mailCount:0,
       visible:false,
   },
    methods:{
       getMailList:function(){
           let self = this;
           $.ajax({
               url:"/models/?show=maillist",
               type:'POST',
               data:{
                   getList:true,
               }
           })
           .always(function (data) {
               self.mailList = [];
               self.errMsg = ""
           })
           .done(function (data) {
               let res = JSON.parse(data);

               if(res.length > 0 ){
                   for(let i = 0; i<res.length; i++){
                       if(res[i].id !== 0 ){
                           self.mailList.push(res[i]);
                       }
                       if(self.mailList.length > 0 ){
                           self.mailCount = self.mailList.length;
                       }
                   }
               }
           })
       },

    },
    beforeMount(){
        let self = this;
        self.visible = true;
        vmSideBar.visible = true;
    },
});
//body section
let vmBody = new Vue({
    delimiters:['%%','%%'],
    el:'.content',
    data:{
        fcs_status:false,
        members:[],
        form_data:{
            show:'mailAddressList',
            tId:"v2",
            mt:'1',
            mi:wcc.model_id,
            al:'',
            ajax:'yes',
        },
        mbr:{
            name:'',
            id:'',
        },
        msg:{
            subject:'',
            textarea:'',
        },
        showEl:false,
        showSearch:false,
        search:'',
        postType:null,
        addressList:null,
        folder_count:null,
        folderCount:{
            inbox:null,
            saved:null,
            sent:null,
            trash:null
        },
        showModalIdExample:false,
        showHoldingIdExample:false,

    },
    computed:{
        filterMembers:function(){
            let self = this;
            return this.members.filter(function (mbr) {
                return mbr.username.toLowerCase().indexOf(self.search.toLowerCase()) >= 0;
            })
        }
    },
    mounted(){
        $(this.$refs.vuemodal).on("hidden.bs.modal", this.bsModal);

        document.onreadystatechange = () => {
            if (document.readyState === "complete") {
                if(typeof siteMail !== "undefined"){
                    if(['mailCompose','maillist','mailReader'].indexOf(siteMail.show) !== -1){
                        this.modelsFolderCount();
                    }
                }
            }
        }

    },
    methods:{
        /**
         * members address list section (al)
         * @param al
         */
        getMembers:function(al){
            let self = this;

            if(self.showEl === true){
                self.showEl = false;
            }
            self.form_data.al = al;
            self.addressList = "yes";

            setTimeout(function () {
                let formData = $('#mainForm');
                let data = formData.serialize();
                $.post({
                    url:'/api/models/messages.php',
                    data:data,
                })
                .always(function () {
                    self.members = [];
                })
                .done(function (data) {
                    let res = JSON.parse(data);
                    if(res.status){
                        self.members = res.data;
                        self.showEl = true;
                    }else{
                        self.members = [];
                    }
                    self.addressList = null;
                });
            },300)
        },
        setMailMember:function(id,username){
            let self = this;
            self.mbr.id = id;
            self.search = username;

            if(siteMail.from_swf){
                console.log('from swift');
                $("html, body").animate({ scrollTop: $('#newMessage').offset().top }, 1000);
            }
            if(self.showSearch){
                self.showSearch = false;
            }
        },
        modelsFolderCount:function () {
            let self = this;
            self.folder_count = "yes";

            setTimeout(function () {
                let formData = $('#mainForm');
                let data = formData.serialize();
                $.post({
                    url:'/api/models/messages.php',
                    data:data,
                })
                    .always(function () {
                        self.folder_count = null;
                        self.folderCount.inbox = null;
                        self.folderCount.saved = null;
                        self.folderCount.sent = null;
                        self.folderCount.trash = null;
                    })
                    .done(function (data) {
                        let res = JSON.parse(data);

                        if(res.status){
                            self.folderCount.inbox = res.data.f_inboxCount;
                            self.folderCount.saved = res.data.f_savedCount;
                            self.folderCount.sent = res.data.f_sentCount;
                            self.folderCount.trash = res.data.f_trashCount;
                        }
                    })
            },500);

        },
        toggle:function(args){
            let self = this;
            if(args == 'showModalIdExample'){
                self.showModalIdExample = true;
            }else if(args == 'showHoldingIdExample'){
                self.showHoldingIdExample = true;
            }
            console.log(args);

        },
        bsModal:function(){
            let self = this;
            self.showHoldingIdExample = false;
            self.showModalIdExample = false
        }
    }
});
