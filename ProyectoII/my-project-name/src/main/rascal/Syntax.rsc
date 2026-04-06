module main::rascal::Syntax

layout Layout = WhitespaceAndComment* !>> [\ \t\r#];
lexical WhitespaceAndComment = [\ \t\n\r] | @category="Comment" "#" ![\n]* $;

start syntax Modulo
    = modulo:
    'defmodule' Identificador Cuerpo 'end';

syntax Cuerpo
    = cuerpo: (Import | Definicion)*;

syntax Import
    = importl: 'using' Identificador "\n" ;

syntax Definicion
    = definicion: SpaceDef | OperatorDef | VarDef | RuleDef | ExpressionDef | EquationDef | Atributos;

syntax SpaceDef 
    = spacedef: 'defspace' Identificador Subspace? 'end';

syntax Subspace
    = subspace: '\<' Identificador;

syntax OperatorDef
    = operatordef: 'defoperator' Identificador ":" Dominio 'end';

syntax Dominio
    = dominio: Identificador ('-\>' Identificador)*;

syntax VarDef
    = vardef: 'defvar' Variable ("," Variable)* 'end';

syntax Variable
    = variable: Identificador ":" Identificador;

syntax RuleDef
    = ruledef: 'defrule' Aplicacion '-\>' Aplicacion 'end';

syntax Aplicacion
    = aplicacion: "(" Identificador Argumento+ ")";

syntax Argumento
    = argumento: Identificador | Aplicacion;

syntax ExpressionDef
    = expressiondef: 'defexpression' Formula Atributos? 'end';

syntax EquationDef
    = equationdef: 'defequation' Termino '=' Termino 'end';

syntax Atributos
    = atributos: "[" Atributo ("," Atributo)* "]";

syntax Atributo
    = atributo: Identificador (":" ValorAtributo)?;

syntax ValorAtributo
    = valoratributo: Identificador;

syntax Formula
    = formula: Cuantificada | Implicacion;

syntax Cuantificada
    = cuantificada: "(" Cuantificador Identificador "in" Identificador "." Formula ")";

syntax Cuantificador
    = cuantificador: 'forall' | 'exists' | "defer";

syntax Implicacion
    = implicacion: Equivalencia ("=\>" Equivalencia)*;

syntax Equivalencia
    = equivalencia: Disyuncion (("=" | "\<\>" | "≡") Disyuncion)*;

syntax Disyuncion
    = disyuncion: Conjuncion ("or" Conjuncion)*;

syntax Conjuncion
    = conjuncion: Negacion ("and" Negacion)*;

syntax Negacion
    = negacion: "neg" Negacion | FormulaAtom;

syntax FormulaAtom
    = formulaatom: Identificador | Relacion | "(" Formula ")";

syntax Relacion
    = relacion: Termino OperadorRelacional Termino | Termino "in" Termino;

syntax OperadorRelacional
    = operadorrelacional: "=" | "\<\>" | "\<" | "\>" | "\<=" | "\>=" | Identificador;

syntax Termino
    = termino: TerminoBase (OperadorTermino TerminoBase)*;

syntax OperadorTermino
    = operadortermino: "+" | "-" | "*" | "/" | "%" | "**" | Identificador;

syntax TerminoBase
    = terminobase: Aplicacion | Identificador | "(" Termino ")";

lexical Identificador = [a-z] [a-z0-9\-]*;

