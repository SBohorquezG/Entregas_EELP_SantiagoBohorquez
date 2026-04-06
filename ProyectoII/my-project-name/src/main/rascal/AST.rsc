module main::rascal::AST

data Modulo = modulo(str nombre, list[ElementoCuerpo] elementos);

data ElementoCuerpo 
    = importElemento(Import importacion)
    | definicionElemento(Definicion definicion);

data Import = importacion(str nombre);

data Definicion
    = defSpace(SpaceDef espacio)
    | defOperator(OperatorDef operador)
    | defVar(VarDef variables)
    | defRule(RuleDef regla)
    | defExpression(ExpressionDef expresion)
    | defEquation(EquationDef ecuacion)
    | defAtributos(Atributos atributos);

data SpaceDef = spaceDef(str nombre, SubspaceOpt subspace);

data SubspaceOpt 
    = sinSubspace()
    | conSubspace(str nombre);

data OperatorDef = operatorDef(str nombre, Dominio dominio);

data Dominio = dominio(list[str] nombres);

data VarDef = varDef(list[Variable] variables);

data Variable = variable(str nombre, str dominio);

data RuleDef = ruleDef(Aplicacion izquierda, Aplicacion derecha);

data Aplicacion = aplicacion(str nombre, list[Argumento] argumentos);

data Argumento
    = argumentoIdentificador(str nombre)
    | argumentoAplicacion(Aplicacion aplicacion);

data ExpressionDef = expressionDef(Formula formula, AtributosOpt atributos);

data AtributosOpt
    = sinAtributos()
    | conAtributos(Atributos atributos);

data EquationDef = equationDef(Termino izquierdo, Termino derecho);

data Atributos = atributos(list[Atributo] atributos);

data Atributo = atributo(str nombre, ValorAtributoOpt valor);

data ValorAtributoOpt
    = sinValorAtributo()
    | conValorAtributo(ValorAtributo valor);

data ValorAtributo = valorAtributo(str valor);

data Formula
    = formulaCuantificada(Cuantificada cuantificada)
    | formulaImplicacion(Implicacion implicacion);

data Cuantificada = cuantificada(Cuantificador cuantificador, str variable, str dominio, Formula formula);

data Cuantificador
    = forall()
    | exists()
    | defer();

data Implicacion = implicacion(Equivalencia primera, list[ImplicacionResto] resto);

data ImplicacionResto = implicacionResto(Equivalencia equivalencia);

data Equivalencia = equivalencia(Disyuncion primera, list[EquivalenciaResto] resto);

data EquivalenciaResto = equivalenciaResto(OperadorEquivalencia operador, Disyuncion disyuncion);

data OperadorEquivalencia
    = opIgual()
    | opDistinto()
    | opEquivalente();

data Disyuncion = disyuncion(Conjuncion primera, list[DisyuncionResto] resto);

data DisyuncionResto = disyuncionResto(Conjuncion conjuncion);

data Conjuncion = conjuncion(Negacion primera, list[ConjuncionResto] resto);

data ConjuncionResto = conjuncionResto(Negacion negacion);

data Negacion
    = negacion(Negacion negada)
    | negacionAtomica(FormulaAtom formulaAtom);

data FormulaAtom
    = formulaAtomIdentificador(str nombre)
    | formulaAtomRelacion(Relacion relacion)
    | formulaAtomParentesis(Formula formula);

data Relacion
    = relacionBinaria(Termino izquierdo, OperadorRelacional operador, Termino derecho)
    | relacionPertenencia(Termino izquierdo, Termino derecho);

data OperadorRelacional
    = opRelIgual()
    | opRelDistinto()
    | opRelMenor()
    | opRelMayor()
    | opRelMenorIgual()
    | opRelMayorIgual()
    | opRelIdentificador(str nombre);

data Termino = termino(TerminoBase primero, list[OperacionTermino] resto);

data OperacionTermino = operacionTermino(OperadorTermino operador, TerminoBase terminoBase);

data OperadorTermino
    = opSuma()
    | opResta()
    | opMultiplicacion()
    | opDivision()
    | opModulo()
    | opPotencia()
    | opTerminoIdentificador(str nombre);

data TerminoBase
    = terminoBaseAplicacion(Aplicacion aplicacion)
    | terminoBaseIdentificador(str nombre)
    | terminoBaseParentesis(Termino termino);