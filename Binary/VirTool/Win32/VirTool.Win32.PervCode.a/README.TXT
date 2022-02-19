
                                CODE PERVERTOR
                                 release 1.01

  Lets imagine next thing.
  We wrote a virus which partially permutates all code it can find -
  in the CODE sections, binary files, etc.
  Sure, it will be too hard to perform such thing in all meaning of
  permutation, but its easy to replace some instructions or instruction
  groups with their equivalents of the same length.
  What will be achieved performing that hard task?

  - EXECUTABLE FILES will be changed
  - PACKED executables&packer checksums will be changed
  - TROJANs&their checksums will be changed
    (tested on some trojans - all became undetectable)
  - VIRUSES&their checksums will be changed

  So, IDA will not understand standard libraries.
  Antiviruses will be unable to detect most of objects processed with
  such mutation.

  Of course probablity of meeting of two viruses on the same PC is low.
  But anyway there are also lots of packers/trojans.

  ===========================================================================

  Here is an utility (not a virus) to show mutation described above.

  PERVERT.EXE [/a] filename

  /a       -- change all possible instructions, otherwise randomly
  filename -- file to be changed

  MUTATION:
  take 4k of code from entrypoint and replace some instructions with their
  equivalents.

  Example: SAMPLE1.EXE -- before mutation, SAMPLE2.EXE -- after.

                              Seek & Enjoy! X-)
                                                              z0mbie.cjb.net

