Monkeys::Changer.tap do | change |

  # file 'monkeys/cache/input.txt' depend on two files
  # on a file 'saces/cache/input.txt'
  # and
  # on this file, the file, where a Mokeys::Filer instance created

  # if both of them are older, then 'monkeys/cache/input.txt'
  # patching will not be executed

  change.file 'cache/input.txt' do | file |

    file.line 1, '1', '2'

  end

  change.file 'cache/input.txt' do | file |

    file.line 1, '1', 'not called'

  end

end
