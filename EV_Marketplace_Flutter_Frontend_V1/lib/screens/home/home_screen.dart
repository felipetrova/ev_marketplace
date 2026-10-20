import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/station.dart';
import '../../services/app_state.dart';
import '../../widgets/station_card.dart';
import '../station/station_detail_screen.dart';
import '../history/history_screen.dart';
import '../profile/profile_screen.dart';
import '../host/host_screen.dart';

class HomeScreen extends StatefulWidget { const HomeScreen({super.key}); @override State<HomeScreen> createState()=>_HomeScreenState(); }
class _HomeScreenState extends State<HomeScreen>{ int index=0; final search=TextEditingController();
  @override Widget build(BuildContext context){ final pages=[_HomeBody(search:search),const HistoryScreen(),const ProfileScreen()]; return Scaffold(body:pages[index],bottomNavigationBar:NavigationBar(selectedIndex:index,onDestinationSelected:(v)=>setState(()=>index=v),destinations:const[NavigationDestination(icon:Icon(Icons.map_outlined),selectedIcon:Icon(Icons.map),label:'Explorar'),NavigationDestination(icon:Icon(Icons.receipt_long_outlined),selectedIcon:Icon(Icons.receipt_long),label:'Reservas'),NavigationDestination(icon:Icon(Icons.person_outline),selectedIcon:Icon(Icons.person),label:'Perfil')])); }
}
class _HomeBody extends StatelessWidget { final TextEditingController search; const _HomeBody({required this.search});
  @override Widget build(BuildContext context){final state=context.watch<AppState>(); return SafeArea(child:CustomScrollView(slivers:[SliverPadding(padding:const EdgeInsets.fromLTRB(20,20,20,8),sliver:SliverToBoxAdapter(child:Column(crossAxisAlignment:CrossAxisAlignment.start,children:[Text('Olá, ${state.userName} 👋',style:Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight:FontWeight.bold)),const SizedBox(height:4),const Text('Encontre uma recarga perto de você.'),const SizedBox(height:16),TextField(controller:search,decoration:const InputDecoration(hintText:'Buscar por cidade ou carregador',prefixIcon:Icon(Icons.search),suffixIcon:Icon(Icons.tune)))]))),
  SliverPadding(padding:const EdgeInsets.fromLTRB(20,8,20,8),sliver:SliverToBoxAdapter(child:Card(child:Padding(padding:const EdgeInsets.all(16),child:Row(children:[Icon(Icons.local_offer,color:Theme.of(context).colorScheme.primary,size:30),const SizedBox(width:12),const Expanded(child:Column(crossAxisAlignment:CrossAxisAlignment.start,children:[Text('Sua primeira recarga é cortesia',style:TextStyle(fontWeight:FontWeight.bold)),SizedBox(height:3),Text('Reserve seu primeiro carregador sem custo.')]))]))))),
  SliverPadding(padding:const EdgeInsets.fromLTRB(20,8,20,8),sliver:SliverToBoxAdapter(child:Row(children:[const Text('Carregadores próximos',style:TextStyle(fontSize:19,fontWeight:FontWeight.bold)),const Spacer(),TextButton(onPressed:()=>Navigator.push(context,MaterialPageRoute(builder:(_)=>const HostScreen())),child:const Text('Sou anfitrião'))]))),
  SliverPadding(padding:const EdgeInsets.fromLTRB(20,0,20,24),sliver:SliverList.builder(itemCount:demoStations.length,itemBuilder:(context,i)=>Padding(padding:const EdgeInsets.only(bottom:10),child:StationCard(station:demoStations[i],onTap:()=>Navigator.push(context,MaterialPageRoute(builder:(_)=>StationDetailScreen(station:demoStations[i]))))))),
  SliverPadding(padding:const EdgeInsets.fromLTRB(20,0,20,20),sliver:SliverToBoxAdapter(child:Text(state.backendOnline?'Backend conectado':'Modo demonstração — backend indisponível',style:TextStyle(fontSize:12,color:state.backendOnline?Colors.green:Colors.orange))) )])); }
}
