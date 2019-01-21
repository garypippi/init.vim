<?php

return PhpCsFixer\Config::create()->setRules([
    'array_indentation' => true,
    'braces' => [
        'allow_single_line_closure' => true,
        'position_after_functions_and_oop_constructs' => 'next'
    ],
    'function_declaration' => ['closure_function_spacing' => 'one'],
    'method_chaining_indentation' => true
])->setUsingCache(false);
