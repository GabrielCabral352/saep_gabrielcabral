<template>
  <main class="flexRowCenter">
    <div class="main_container flexColumnCenter">
      <img src="techman.png" alt="">
      <div class="login flexColumnCenter">
        <input v-model="password" disabled type="password" class="password_field">
        <div class="numbers_input flexColumnCenter">
          <div v-for="(row, index) in buttons" :key="index" class="number_row flexRowCenter" >
            <button @click="setPassword(numbers)" v-for="numbers in row" :key="numbers" class="singleBtn">
              {{numbers}}
            </button>
          </div>
        </div>
      </div>
    </div>
  </main>
</template>

<script>
export default {
  name: 'Login',
  data(){
    return{
      password: '',
      buttons: [[1,2,3],
                [4,5,6],
                [7,8,9],
                ["C", 0,"↵"]]
    }
  },
  methods:{
    setPassword: function(option){
      console.log(option)
      if(isNaN(option)){
        if(option === 'C'){
          this.password = ''
        }else{
          console.log("Trying to login")
          if(this.password.length >= 6){
            this.tryLogin()
          }else{
            alert("Senha dever contem pelo menos 6 digitos")
          }
        }
      }else{
        this.password += option;
      }
    },
    tryLogin: function(){
      this.$axios.post(this.$store.state.BASE_URL + "/users/?auth=1", {'password':this.password})
      .then((reponse)=>{
        console.log(reponse.data)
        if(reponse.data.msg[0].name !==undefined){
          console.log(1)
          localStorage.user = reponse.data.msg[0].id
          this.$router.push("/home")
        }else{
          alert(reponse.data.msg)
          this.password = ""
        }
      })
      .catch((e)=>console.log(e.data))
    },
  }
}
</script>

<style scoped lang="scss">
  main{
    width: 100vw;
    height: 100vh;
    max-height: 100vh;
    background-color: #cce2e2;
    
    .main_container{
      width: 80vw;
      max-width: 400px;
      height: 80vh;
      max-height: 600px;

      img{
        height: 30%;
        max-height: 90px;
      }
      
      .login{
        width: 100%;
        height: calc(100% - 120px);
        background-color: #eeedeb;
        padding: 10% 15%;
        .password_field{
          border: 0;
          border-bottom: 1px solid black;
          height: 30px;
          outline: 0;
          width: 80%;
          text-align: center;
          background: none;
          font-size: 20px;
        }
        .numbers_input{
          padding: 20px 0 0 0;
          
          .number_row{
            // margin: .7%;
            background-color: none;
            .singleBtn{
              margin: 2%;
              border-radius: 100%;
              border-color: #44babc;
              border-style: solid;
              // margin: 10px;
              width: 60px;
              height: 60px;
              min-width: 60px;
              font-size: 20px;
              color: #35797d;
              cursor: pointer;
              &:hover{
                background: #44babc;
                color: #eeedeb;
              }
            }
          }
        }
      }
    }
  }
</style>