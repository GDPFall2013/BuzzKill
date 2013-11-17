part of bot;

// http://en.wikipedia.org/wiki/Tarjan's_strongly_connected_components_algorithm

class TarjanCycleDetect<TNode> {

  int _index = 0;
  final List<_TarjanNode> _stack;
  final List<List<TNode>> _scc;
  final _TarjanList _list;

  TarjanCycleDetect._internal(this._list) :
    _index = 0,
    _stack = new List<_TarjanNode<TNode>>(),
    _scc = new List<List<TNode>>();

  static List<List> getStronglyConnectedComponents(Map graph) {
    assert(graph != null);

    var nodes = new _TarjanList(graph);
    var tarjan = new TarjanCycleDetect._internal(nodes);
    return tarjan._executeTarjan();
  }

  List<List<TNode>> _executeTarjan() {
    List<_TarjanNode> nodeList = new List<_TarjanNode>.from(_list.getSourceNodeSet());
    for (final node in nodeList)
    {
      if(node.index == -1) {
        _tarjan(node);
      }
    }
    return _scc;
  }

  void _tarjan(_TarjanNode<TNode> v){
    v.index = _index;
    v.lowlink = _index;
    _index++;
    _stack.insert(0, v);
    for(final n in _list.getAdjacent(v)){
      if(n.index == -1){
        _tarjan(n);
        v.lowlink = math.min(v.lowlink, n.lowlink);
      } else if(_stack.indexOf(n) >= 0){
        v.lowlink = math.min(v.lowlink, n.index);
      }
    }
    if(v.lowlink == v.index){
      _TarjanNode n;
      var component = new List<TNode>();
      do {
        n = _stack[0];
        _stack.removeRange(0, 1);
        component.add(n.value);
      } while(n != v);
      _scc.add(component);
    }
  }
}

class _TarjanNode<TNode> {
  final TNode value;
  int index;
  int lowlink;

  _TarjanNode(this.value):
    index = -1;

  int get hashCode => value.hashCode;

  bool operator ==(_TarjanNode<TNode> other) => other.value == value;
}

class _TarjanList<TNode> {
  final Map<_TarjanNode<TNode>, Set<_TarjanNode<TNode>>> _nodes;

  _TarjanList._internal(this._nodes);

  factory _TarjanList(Map<TNode, Set<TNode>> source) {
    assert(source != null);

    var map = new Map<TNode, _TarjanNode<TNode>>();

    var nodes = new Map<_TarjanNode<TNode>, Set<_TarjanNode<TNode>>>();

    source.forEach((k,v) {
      final tKey = map.putIfAbsent(k, () => new _TarjanNode(k));
      var edges = nodes[tKey] = new Set<_TarjanNode<TNode>>();

      if(v != null) {
        for(final edge in v) {
          final tEdge = map.putIfAbsent(edge, () => new _TarjanNode(edge));
          edges.add(tEdge);
        }
      }
    });

    return new _TarjanList._internal(nodes);
  }

  Iterable<_TarjanNode> getSourceNodeSet() {
    return _nodes.keys;
  }

  Iterable<_TarjanNode> getAdjacent(_TarjanNode v) {
    var nodes = _nodes[v];
    if(nodes == null) {
      return [];
    }
    else {
      return nodes;
    }
  }
}
