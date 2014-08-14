part of test;

final DATA = [
  /* [Dart, MsgPack, JSON, JSON_VERBOSE] */
  [[null], [null], [null], [null]],
  [[0], [0], [0], [0]],
  [[-47], [-47], [-47], [-47]],
  [[1<<60], [1<<60], ["~i${1<<60}"], ["~i${1<<60}"]],
  [[1<<90], ["~n${1<<90}"], ["~n${1<<90}"], ["~n${1<<90}"]],
  [[""], [""], [""], [""]],
  [["~test"], ["~~test"], ["~~test"], ["~~test"]],
  [["^0"], ["~^0"], ["~^0"], ["~^0"]],
  [["šôš漢字"], ["šôš漢字"], ["šôš漢字"], ["šôš漢字"]],
  [[4.2], ["~f4.2"], ["~f4.2"], ["~f4.2"]],
  [[true], [true], [true], [true]],
  [[new Keyword("K")], ["~:K"], ["~:K"], ["~:K"]],
  //[[new Symbol("S")], ["~\$S"], ["~\$S"], ["~\$S"]],
  ["pure", ["~#'","pure"], ["~#'","pure"], {"~#'":"pure"} ],
  [[],[],[],[]],
  [[1,2,3], [1,2,3], [1,2,3], [1,2,3]],
  [[1,[2],[[],3]], [1,[2],[[],3]], [1,[2],[[],3]], [1,[2],[[],3]]],
  [{}, ['~#cmap', []], ['~#cmap', []], {'~#cmap': []}],
  [{[]:0}, ['~#cmap', [[],0]], ['~#cmap', [[],0]], {'~#cmap': [[],0]}],
  [new Set.from([1,2]), ['~#set', [1,2]], ['~#set', [1,2]], {'~#set': [1,2]}],
  [new LinkedList(), ['~#list', []], ['~#list', []], {'~#list': []}],
  [new TaggedValue("tg",2), ['~#tg', 2], ['~#tg', 2], {'~#tg': 2}],
  [new TaggedValue("map",{true:0}), {true:0}, ["^ ",true ,0], {"~?t":0}],
  [new TaggedValue("map",{null:0}), {null:0}, ["^ ",null,0], {"~_":0}],
  [new TaggedValue("map",{1:0}), {1:0}, ["^ ",1,0], {"~i1":0}],
  [
    new Link(Uri.parse("http:www.a.com"),"b","c"),
    ["~#link", {"href": "~rhttp:www.a.com", "rel": "b", "name": "c"}],
    ["~#link", ["^ ", "href", "~rhttp:www.a.com", "rel", "b", "name", "c"]],
    {"~#link": {"href": "~rhttp:www.a.com", "rel": "b", "name": "c"}},         
  ],
  [
    [new DateTime(2047)],
    [["~#m", new DateTime(2047).millisecondsSinceEpoch]],
    [["~#m", new DateTime(2047).millisecondsSinceEpoch]],
    ["~t${new DateTime(2047).toIso8601String()}"],     
  ],
  [
    {new DateTime(2047) : 0},
    ["~#cmap", [["~#m", new DateTime(2047).millisecondsSinceEpoch], 0]],
    ["~#cmap", [["~#m", new DateTime(2047).millisecondsSinceEpoch], 0]],
    {"~#cmap":["~t${new DateTime(2047).toIso8601String()}", 0]},     
  ], 
  [
    [null,true,{2:[3,new TaggedValue("4",5)]}],
    [null,true,["~#cmap",[2,[3,["~#4",5]]]]],
    [null,true,["~#cmap",[2,[3,["~#4",5]]]]],
    [null,true,{"~#cmap":[2,[3,{"~#4":5}]]}],     
  ],
        
];