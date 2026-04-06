module main::rascal::Parser

import main::rascal::Syntax;
import ParseTree;

public start[Modulo] parseModulo(str src, loc origin) = parse(#start[Modulo], src, origin);
public start[Modulo] parseModulo(loc origin) = parse(#start[Modulo], origin);
