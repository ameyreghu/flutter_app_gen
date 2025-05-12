
sealed class Result<S, F> {

   when(
    OnSucess<S> onSucess,
    OnFailure<F> onFailure
   ){
    var result=this;
   return switch (result){
    Success()=> onSucess(result.data),
    Failed()=>onFailure(result.failure),
   };
  }

 bool isSucess(){
   return switch(this){
    Success()=>true,
    Failed()=>false,
   };
 }
 bool isFailure(){
   return switch(this){
    Success()=>false,
    Failed()=>true,
   };
 }
}

class Success<S, F> extends Result<S, F> {
  Success(this.data);
  final S data;
}

class Failed<S, F> extends Result<S, F> {
  Failed(this.failure);
  final F failure;
}

typedef OnSucess<S> = Function(S data);

typedef OnFailure<F> = Function(F failure);



