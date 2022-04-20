<?php

namespace App\Links;

class LinksProductDTOGenerator extends LinksGenerator
{
    protected function createLinks(object $object)
    {
/* générateur de routage * /
        $object->set_links(['self' => $this->urlGenerator->generate('detailsProduct', ['id' => $object->getId()], 0),
                            'list' => $this->urlGenerator->generate('listOfProducts', [], 0),
                            'add' => $this->urlGenerator->generate('addProduct', [], 0),
                            'delete' => $this->urlGenerator->generate('deleteProduct', ['id' => $object->getId()], 0)
        ]);
    }
}
