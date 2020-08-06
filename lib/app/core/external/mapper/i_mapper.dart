abstract class IMapper<M, E>{
  M to([E object]);
  E from([M object]);
  M convert([dynamic json]);
}