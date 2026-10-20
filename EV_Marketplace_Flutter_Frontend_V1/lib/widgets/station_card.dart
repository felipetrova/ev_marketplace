import 'package:flutter/material.dart';
import '../models/station.dart';

class StationCard extends StatelessWidget { final Station station; final VoidCallback onTap; const StationCard({super.key,required this.station,required this.onTap});
  @override Widget build(BuildContext context)=>Card(child:InkWell(onTap:onTap,borderRadius:BorderRadius.circular(18),child:Padding(padding:const EdgeInsets.all(16),child:Column(crossAxisAlignment:CrossAxisAlignment.start,children:[
    Row(children:[Container(width:54,height:54,decoration:BoxDecoration(color:Theme.of(context).colorScheme.primaryContainer,borderRadius:BorderRadius.circular(14)),child:Icon(Icons.ev_station,color:Theme.of(context).colorScheme.primary)),const SizedBox(width:12),Expanded(child:Column(crossAxisAlignment:CrossAxisAlignment.start,children:[Text(station.name,style:const TextStyle(fontWeight:FontWeight.bold,fontSize:16)),const SizedBox(height:4),Text(station.address,style:Theme.of(context).textTheme.bodySmall)])),Icon(station.available?Icons.check_circle:Icons.cancel,color:station.available?Colors.green:Colors.grey)]),
    const SizedBox(height:14), Row(children:[const Icon(Icons.star,size:18),const SizedBox(width:4),Text(station.rating.toString()),const SizedBox(width:16),Text(station.connector),const SizedBox(width:16),Text('${station.powerKw} kW'),const Spacer(),Text('R\$ ${station.pricePerHour.toStringAsFixed(0)}/h',style:const TextStyle(fontWeight:FontWeight.bold))])
  ]))));
}
