<?php

namespace App\Paging;

use App\Exceptions\ApiException;
use App\Repository\PersonRepository;
use App\Entity\User;
use Symfony\Component\Security\Core\Security;

class PeoplePaging
{
    /* limited of 5 fileds * /
    private const NB_PEOPLE_PAGED = 5;
    private $repository;
    private $security;
    private $nbPeople;
    private $maxPages;

    public function __construct(
        PersonRepository $repository

    ) {
        $this->repository = $repository;
        $this->nbPeople = $this->repository->count([]);
        $this->maxPages = intval(ceil($this->nbPeople / self::NB_PEOPLE_PAGED));
    }

    public function getDatas($page)
    {
        if (null === $page) {
            return $people = $this->epository->findAll();
        }

        if (1 > $page || $page > $this->maxPages) {
            throw new ApiException('The page must be between 1 and '.$this->maxPages.'.', 404);
        }

        $offset = self::NB_PEOPLE_PAGED * ($page - 1);

        return $people = $this->repository->findBy([], [], self::NB_PEOPLE_PAGED, $offset);
    }
}
