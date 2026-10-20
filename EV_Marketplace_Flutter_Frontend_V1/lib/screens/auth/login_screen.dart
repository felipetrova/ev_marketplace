import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../services/app_state.dart';

class LoginScreen extends StatefulWidget { const LoginScreen({super.key}); @override State<LoginScreen> createState()=>_LoginScreenState(); }
class _LoginScreenState extends State<LoginScreen> {
  final email = TextEditingController(); final password = TextEditingController();
  bool loading=false;
  @override void dispose(){email.dispose();password.dispose();super.dispose();}
  Future<void> submit() async { setState(()=>loading=true); await context.read<AppState>().login(email.text.isEmpty?'motorista@exemplo.com':email.text,password.text); if(mounted)setState(()=>loading=false); }
  @override Widget build(BuildContext context)=>Scaffold(body: SafeArea(child: Center(child: SingleChildScrollView(padding: const EdgeInsets.all(24),child: Column(crossAxisAlignment: CrossAxisAlignment.stretch,children:[
    Icon(Icons.ev_station,size:72,color:Theme.of(context).colorScheme.primary), const SizedBox(height:16),
    Text('EV Marketplace',style:Theme.of(context).textTheme.headlineMedium?.copyWith(fontWeight:FontWeight.bold),textAlign:TextAlign.center),
    const SizedBox(height:8), const Text('Encontre, reserve e utilize carregadores de veículos elétricos.',textAlign:TextAlign.center), const SizedBox(height:32),
    TextField(controller:email,keyboardType:TextInputType.emailAddress,decoration:const InputDecoration(labelText:'E-mail',prefixIcon:Icon(Icons.email_outlined))), const SizedBox(height:12),
    TextField(controller:password,obscureText:true,decoration:const InputDecoration(labelText:'Senha',prefixIcon:Icon(Icons.lock_outline))), const SizedBox(height:20),
    FilledButton(onPressed:loading?null:submit,child:Padding(padding:const EdgeInsets.all(14),child:loading?const CircularProgressIndicator():const Text('Entrar'))),
    const SizedBox(height:12), OutlinedButton(onPressed:submit,child:const Text('Criar minha conta')),
    const SizedBox(height:24), const Text('Primeira recarga cortesia*',textAlign:TextAlign.center,style:TextStyle(fontWeight:FontWeight.w700)), const SizedBox(height:4), const Text('*Conforme regras promocionais da plataforma.',textAlign:TextAlign.center,style:TextStyle(fontSize:12)),
  ])))));
}
