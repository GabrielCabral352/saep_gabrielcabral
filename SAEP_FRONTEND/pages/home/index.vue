<template>
    <main class="body_content">
        <div class="header flexRowCenter">
            <div class="img_container">
                <img src="techman.png" alt="">
            </div>
            <div class="side_options flexRowCenter">
                <p class="new_tool" >Novo Equipamento</p>
                <p class="logoff"><img @click="logout"  src="logout_sair.png"/> </p>
            </div>
        </div>
        <div class="main_body_content flexColumnCenter">
            <div class="card flexRowCenter" v-for="(x, index) in tools" :key="index">
                <div class="side_img flexRowCenter">
                    <img :src="`${$store.state.BASE_URL}${x.image}`" alt="">
                </div>
                <div class="side_desc flexColumnCenter">
                    <p class="card_title">
                        {{x.name}}
                    </p>
                    <p class="description">
                        {{x.description}}
                    </p>
                    <div class="m_option flexRowCenter">
                        <p class="comment icon"><img @click="showCommentPop(x.id)" src="comentario.png" alt=""></p>
                        <p class="delete icon"><img @click="showDelPop(x.id)" src="deletar.png" alt=""></p>
                    </div>
                </div>
            </div>
            
        </div>



        <!-- delete pop -->
        <div class="popbg flexRowCenter" v-if="deletePop">
            <div class="popup flexColumnCenter">
                <div class="title flexRowCenter">
                    <p class="m_title">Exclusão de Equipamento</p>
                    <p @click="showDelPop()" class="icon">X</p>
                    
                </div>
                <p class="pop_desc">Atenção! tem certeza que deseja excluir o equipamento? Essa ação não podera ser desfeita.</p>
                <button @click="deletar()" class="confim">Excluir</button>
            </div>
        </div>




        <!-- comments pop -->

        <div class="popbg flexRowCenter" v-if="commentPop">
            <div class="popup flexColumnCenter comments">
                <div class="title flexRowCenter">
                    <p class="m_title">Comentários</p>
                    <p @click="showCommentPop()" class="icon">X</p>
                    
                </div>
                <div class="comments">
                    
                    <div class="single_comments flexColumnCenter" v-for="(item, index) in comments" :key="index">
                        <p class="title">{{item.fk_user.name}} - {{item.commentDate}}</p>
                        <p class="desc">{{item.description}}</p>
                    </div>
                </div>
                <button @click="addComment()" class="comment_new">Adiciona Comentário</button>
            </div>
        </div>


        <!-- new comment -->

        <div class="popbg flexRowCenter" v-if="newCommnet">
            <div class="popup flexColumnCenter newcomments">
                <div class="title flexRowCenter">
                    <p class="m_title">Cadastro De comentários</p>
                    <p @click="addComment()" class="icon">X</p>
                </div>
                <div>
                    <p class="ex_title">Comentário</p>
                    <input type="text">
                </div>
                <button @click="sendComment()" class="comment_new">Adiciona Comentário</button>
            </div>
        </div>
        
    </main>
</template>

<script>
export default {
  name: 'Home',

  data(){
      return{
          tools:[],
          comments: [],
          deletePop: false,
          commentPop: false,
          newCommnet: false,
          cId: null
      }
  },
  methods:{
      logout: function(){
          this.$router.push('/')
      },

      addComment:function(){
          console.log(1)
          this.newCommnet = !this.newCommnet
          this.commentPop = false
      },
      showCommentPop:function(id=null){
          this.commentPop = !this.commentPop
          if(id !== null){
              this.getComments(id)
          }

      },
      sendComment: function(){
          this.$axios.post(this.$store.state.BASE_URL + "/comment/", {
              
          })
          .then((response)=>{
              alert("Deletado com sucesso")
              document.location.reload(true);

          })
      },
      showDelPop: function(id=null){
          this.deletePop = !this.deletePop
          if(id !== null){
               this.cId = id
          }
         
      },
      deletar: function(){
          this.$axios.delete(this.$store.state.BASE_URL + "/tool/" + this.cId)
          .then((response)=>{
              alert("Deletado com sucesso")
              document.location.reload(true);

          })
      },
      getTools: function(){
        this.$axios.get(this.$store.state.BASE_URL + "/tool").then(
        (response) => {
            // console.log(response.data)
            // console
            this.tools = response.data.data
        }
        ).catch((e)=>{
            console.log(e)
        })
      },
      getComments: function(id){
        this.$axios.get(this.$store.state.BASE_URL + "/comment/?oderByUser=true&&itemid=" + id).then(
        (response) => {
            console.log(response.data)
            // console
            this.comments = response.data.data
    
        }
        ).catch((e)=>{
            console.log(e)
        })
      }
  },
  mounted(){
      console.log(this.$store.state.BASE_URL + "/tool")
      this.getTools()
  }

}
</script>

<style scoped lang="scss">
.body_content{
    width: 100vw;
    height: 100vh;
    background: #eeedeb;
    overflow-y: auto;
    .header{
        width: 100%;
        height: 12%;
        max-height: 80px;
        background: #cce2e2;
        .img_container{
            width: 70%;
            background: none;
            padding: 5px;
            img{
                height: 100%;
                width: auto;
            }
        }
        .side_options{
            width: 30%;
            background: none;
            
            .new_tool{
                height: auto;
                color: #35797d;
                font-size: 20px;
                cursor: pointer;
                width: auto;
                margin-right: 25px;
                &:hover{
                    color: #2a5153;
                }
            }
            .logoff{
                height: 20px;
                width: auto;
                cursor: pointer;
                &:hover{
                    transform: scale(1.1);
                }
            }
        }
    }

    .main_body_content{
        width: 100vw;
        height: auto;
        background: none;
        padding: 10px 20px;
        .card{
            padding: 15px  0;
            border-bottom: 1px solid black;
            justify-content: start;
            align-items: flex-start;
            .side_img{
                background-color: white;
                position: relative;
                height:200px;
                width: 300px;
                overflow: hidden;
                img{
                    
                    width: auto;
                    height: 100%;
                    overflow: hidden;
                }
            }

            .side_desc{
                margin-left: 10px;
                width: 750px;
                .card_title{
                    font-size: 22px;
                    margin-bottom: 10px;
                }
                .description{
                    font-size: 12px;
                }

                .m_option{
                    justify-content: start;
                    .icon{
                        cursor: pointer;
                        margin:5px;
                        width: 20px;

                        &:hover{
                            transform: scale(1.1);
                        }
                    }
                }
            }
        }
    }
    .popbg{
        position: absolute;
        z-index: 200;
        background: rgba(0, 0, 0, 0.6);
        top: 0;
        left: 0;
        
        .popup{
            width: 500px;
            height: 200px;
            background: #eeedeb;
            border: 1px solid black;
            align-items: flex-start;
            justify-content: start;
            div{
            .ex_title{
                padding: 10px 0 0 20px;
                font-size: 14px;
                height: auto;
            }
            input{
                width: 90%;
                margin-left: 5%;
                height: 50px;
                outline: 0;
                font-size: 20px;
                background: none;
                border: none;
                border-bottom: 1px solid black;
            }
            }
            
            .title{
                align-items: flex-start;
                height: auto;

                .m_title{
                    font-size: 18px;
                    padding: 10px;
                    margin-left: 15px;
                    width: 500px;
                    // background: red;
                }
                .icon{
                    font-size: 18px;
                    padding: 10px;
                    width: 10%;
                    cursor: pointer;
                    font-weight: bold; 
                    background: none;
                    height: auto;
                    text-align: center;
                    &:hover{
                        background: rgb(212, 76, 76);
                        color: white;
                    }
                }
                
            }
        
            .comments{
                width: 100%;
                height: auto;
                // background:  red;
                .single_comments{
                    height: auto;
                }
            }

            
            .pop_desc{
                padding: 0 20px;
                font-size: 14px;
                margin-bottom: -150px;
            }
            .confim{

                width: 100px;
                height: 80px;
                border-radius: 7px;
                outline: 0;
                cursor: pointer;
                border: none;
                background: rgb(181, 41, 41);
                color: white;
                margin: 0 0 15px 15px;

                &:hover{
                    background: rgb(105, 35, 35);;
                }
            }
        }
        .comments{
            height: 70%;
            overflow-y: auto;
            
            .single_comments{
                width: 90%;
                border-bottom: 1px solid black;
                padding: 15px;
                margin: 15px;
                .title{
                    font-size: 14px;
                    font-style: italic;
                
                }
                .desc{
                    padding: 10px 0 0 0;
                    font-size: 13px;
                }
            }
            .comment_new{
                width: 150px;
                height: 50px;
                border-radius: 7px;
                outline: 0;
                cursor: pointer;
                border: none;
                background: rgb(181, 41, 41);
                color: white;
                margin: 0 0 15px 15px;

                &:hover{
                    background: rgb(105, 35, 35);;
                }
            }
        }
    }
}
</style>