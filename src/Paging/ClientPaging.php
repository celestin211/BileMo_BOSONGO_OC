<?php

namespace App\Paging;

use App\Exceptions\ApiException;
//use App\Repository\ClientRepository;
use Symfony\Component\Security\Core\Security;

class ClientPaging
{
    private const NB_PEOPLE_PAGED = 4;
    private $clientRepository;
    private $security;
    private $nbClient;
    private $maxPages;
    private $idUserClient;

    public function __construct(
      //ClientRepository $repository,
        Security $security
    ) {
        $this->clientRepository = $clientRepository;
        $this->security = $security;
        $this->idUserClient = $this->security->getUser()->getId();
        $this->nbClient = $this->clientRepository->count(['userClient' => $this->idUserClient]);
        $this->maxPages = intval(ceil($this->nbClient / self::NB_PEOPLE_PAGED));
    }

    public function getDatas($page)
    {
        if (null === $page) {
            return $people = $this->repository->findBy(['userClient' => $this->idUserClient], ['email' => 'ASC']);
        }

        if (1 > $page || $page > $this->maxPages) {
            throw new ApiException('The page must be between 1 and '.$this->maxPages.'.', 404);
        }

        $offset = self::NB_PEOPLE_PAGED * ($page - 1);

        return $people = $this->clientRepository->findBy(['userClient' => $this->idUserClient], ['email' => 'ASC'], self::NB_PEOPLE_PAGED, $offset);
    }
}
