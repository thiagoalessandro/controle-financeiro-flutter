abstract class IMapper<M, E>{
  Map toJson([E object]);
  E from([M object]);
  M convert([dynamic json]);
}