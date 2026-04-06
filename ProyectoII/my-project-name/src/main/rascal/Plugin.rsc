module main::rascal::Plugin

import IO;
import ParseTree;
import util::Reflective;
import util::IDEServices;
import util::LanguageServer;
import Relation;

import main::rascal::Syntax;

PathConfig pcfg = getProjectPathConfig(|project://my-project-name|);
Language tdslLang = language(pcfg, "TDSL", "tdsl", "Plugin", "contribs");

set[LanguageService] contribs() = {
    parser(start[Modulo] (str program, loc src) {
        println("Run parser");
        return parse(#start[Modulo], program, src);
    })
};

void main() {
    registerLanguage(tdslLang);
}
