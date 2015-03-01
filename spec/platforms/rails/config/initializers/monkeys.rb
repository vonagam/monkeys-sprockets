Monkeys::Changer.tap do | change |

  change.file 'library.js' do | file |

    file.line 1, "var x = [\n" do | line |

      [ 'hello', 'manki' ]

    end

  end

end
